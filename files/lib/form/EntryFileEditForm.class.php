<?php
// wsif imports
require_once(WSIF_DIR.'lib/form/EntryFileAddForm.class.php');

/**
 * Shows the entry file edit form.
 *
 * @author	Sebastian Oettl
 * @copyright	2009-2012 WCF Solutions <http://www.wcfsolutions.com/>
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package	com.wcfsolutions.wsif
 * @subpackage	form
 * @category	Infinite Filebase
 */
class EntryFileEditForm extends EntryFileAddForm {
	/**
	 * file id
	 * 
	 * @var	integer
	 */
	public $fileID = 0;
	
	/**
	 * file editor object
	 * 
	 * @var	EntryFileEditor
	 */
	public $file = null;
	
	/**
	 * @see Page::readParameters()
	 */
	public function readParameters() {
		AbstractForm::readParameters();

		// get file
		if (isset($_REQUEST['fileID'])) $this->fileID = intval($_REQUEST['fileID']);
		$this->file = new EntryFileEditor($this->fileID);
		if (!$this->file->fileID) {
			throw new IllegalLinkException();
		}
		
		// get entry frame
		$this->frame = new EntryFrame($this, $this->file->entryID);
		
		// check permission
		if (!$this->file->isEditable($this->frame->getCategory())) {
			throw new PermissionDeniedException();
		}
	}
	
	/**
	 * @see	Form::validate()
	 */
	public function validate() {
		AbstractForm::validate();
		
		if (empty($this->title)) {
			throw new UserInputException('title');
		}
	}
	
	/**
	 * @see Form::save()
	 */
	public function save() {
		AbstractForm::save();
		
		// update file
		$this->file->update($this->title, $this->description);
		$this->saved();
		
		// forward to file
		HeaderUtil::redirect('index.php?page=EntryFile&fileID='.$this->file->fileID.SID_ARG_2ND_NOT_ENCODED);
		exit;
	}
	
	/**
	 * @see Page::readData()
	 */
	public function readData() {
		parent::readData();

		if (!count($_POST)) {
			$this->title = $this->file->title;
			$this->description = $this->file->description;
		}
	}
	
	/**
	 * @see Page::assignVariables()
	 */
	public function assignVariables() {
		parent::assignVariables();
		
		WCF::getTPL()->assign(array(
			'action' => 'edit',
			'fileID' =>  $this->fileID,
			'file' => $this->file
		));
	}
}
?>