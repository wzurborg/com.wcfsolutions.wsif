DROP TABLE IF EXISTS wsif1_1_category;
CREATE TABLE wsif1_1_category (
	categoryID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	parentID INT(10) NOT NULL DEFAULT 0,
	category VARCHAR(255) NOT NULL DEFAULT '',
	allowDescriptionHtml TINYINT(1) NOT NULL DEFAULT 0,
	categoryType TINYINT(1) NOT NULL DEFAULT 0,
	icon VARCHAR(255) NOT NULL DEFAULT '',
	externalURL VARCHAR(255) NOT NULL DEFAULT '',
	time INT(10) NOT NULL DEFAULT 0,
	styleID INT(10) NOT NULL DEFAULT 0,
	enforceStyle TINYINT(1) NOT NULL DEFAULT 0,
	daysPrune SMALLINT(5) NOT NULL DEFAULT 0,
	sortField VARCHAR(20) NOT NULL DEFAULT '',
	sortOrder VARCHAR(4) NOT NULL DEFAULT '',
	clicks INT(10) NOT NULL DEFAULT 0,
	entries INT(10) NOT NULL DEFAULT 0,
	entryImages INT(10) NOT NULL DEFAULT 0,
	entryFiles INT(10) NOT NULL DEFAULT 0,
	entryDownloads INT(10) NOT NULL DEFAULT 0,
	enableRating TINYINT(1) NOT NULL DEFAULT -1,
	entriesPerPage SMALLINT(5) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_category_last_entry;
CREATE TABLE wsif1_1_category_last_entry (
	categoryID INT(10) NOT NULL DEFAULT 0,
	languageID INT(10) NOT NULL DEFAULT 0,
	entryID INT(10) NOT NULL DEFAULT 0,
	PRIMARY KEY (categoryID, languageID, entryID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_category_moderator;
CREATE TABLE wsif1_1_category_moderator (
	categoryID INT(10) NOT NULL DEFAULT 0,
	userID INT(10) NOT NULL DEFAULT 0,
	groupID INT(10) NOT NULL DEFAULT 0,
	canEditEntry TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteEntry TINYINT(1) NOT NULL DEFAULT -1,
	canViewDeletedEntry TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteEntryCompletely TINYINT(1) NOT NULL DEFAULT -1,
	canEnableEntry TINYINT(1) NOT NULL DEFAULT -1,
	canMoveEntry TINYINT(1) NOT NULL DEFAULT -1,
	canEditEntryComment TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteEntryComment TINYINT(1) NOT NULL DEFAULT -1,
	canEditEntryImage TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteEntryImage TINYINT(1) NOT NULL DEFAULT -1,
	canEditEntryFile TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteEntryFile TINYINT(1) NOT NULL DEFAULT -1,
	KEY (userID),
	KEY (groupID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_category_structure;
CREATE TABLE wsif1_1_category_structure (
	parentID INT(10) NOT NULL DEFAULT 0,
	categoryID INT(10) NOT NULL DEFAULT 0,
	position SMALLINT(5) NOT NULL DEFAULT 0,
	PRIMARY KEY (parentID, categoryID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_category_to_group;
CREATE TABLE wsif1_1_category_to_group (
	categoryID INT(10) NOT NULL DEFAULT 0,
	groupID INT(10) NOT NULL DEFAULT 0,
	canViewCategory TINYINT(1) NOT NULL DEFAULT -1,
	canEnterCategory TINYINT(1) NOT NULL DEFAULT -1,
	canViewEntry TINYINT(1) NOT NULL DEFAULT -1,
	canViewOwnEntry TINYINT(1) NOT NULL DEFAULT -1,
	canAddEntry TINYINT(1) NOT NULL DEFAULT -1,
	canAddEntryWithoutModeration TINYINT(1) NOT NULL DEFAULT -1,
	canRateEntry TINYINT(1) NOT NULL DEFAULT -1,
	canEditOwnEntry TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteOwnEntry TINYINT(1) NOT NULL DEFAULT -1,
	canSetEntryPrefix TINYINT(1) NOT NULL DEFAULT -1,
	canSetEntryTags TINYINT(1) NOT NULL DEFAULT -1,
	canCommentEntry TINYINT(1) NOT NULL DEFAULT -1,
	canEditOwnEntryComment TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteOwnEntryComment TINYINT(1) NOT NULL DEFAULT -1,
	canDownloadEntryCommentAttachment TINYINT(1) NOT NULL DEFAULT -1,
	canViewEntryCommentAttachmentPreview TINYINT(1) NOT NULL DEFAULT -1,
	canUploadEntryCommentAttachment TINYINT(1) NOT NULL DEFAULT -1,
	canEditOwnEntryImage TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteOwnEntryImage TINYINT(1) NOT NULL DEFAULT -1,
	canDownloadEntryFile TINYINT(1) NOT NULL DEFAULT -1,
	canEditOwnEntryFile TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteOwnEntryFile TINYINT(1) NOT NULL DEFAULT -1,
	PRIMARY KEY (groupID, categoryID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_category_to_user;
CREATE TABLE wsif1_1_category_to_user (
	categoryID INT(10) NOT NULL DEFAULT 0,
	userID INT(10) NOT NULL DEFAULT 0,
	canViewCategory TINYINT(1) NOT NULL DEFAULT -1,
	canEnterCategory TINYINT(1) NOT NULL DEFAULT -1,
	canViewEntry TINYINT(1) NOT NULL DEFAULT -1,
	canViewOwnEntry TINYINT(1) NOT NULL DEFAULT -1,
	canAddEntry TINYINT(1) NOT NULL DEFAULT -1,
	canAddEntryWithoutModeration TINYINT(1) NOT NULL DEFAULT -1,
	canRateEntry TINYINT(1) NOT NULL DEFAULT -1,
	canEditOwnEntry TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteOwnEntry TINYINT(1) NOT NULL DEFAULT -1,
	canSetEntryPrefix TINYINT(1) NOT NULL DEFAULT -1,
	canSetEntryTags TINYINT(1) NOT NULL DEFAULT -1,
	canCommentEntry TINYINT(1) NOT NULL DEFAULT -1,
	canEditOwnEntryComment TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteOwnEntryComment TINYINT(1) NOT NULL DEFAULT -1,
	canDownloadEntryCommentAttachment TINYINT(1) NOT NULL DEFAULT -1,
	canViewEntryCommentAttachmentPreview TINYINT(1) NOT NULL DEFAULT -1,
	canUploadEntryCommentAttachment TINYINT(1) NOT NULL DEFAULT -1,
	canEditOwnEntryImage TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteOwnEntryImage TINYINT(1) NOT NULL DEFAULT -1,
	canDownloadEntryFile TINYINT(1) NOT NULL DEFAULT -1,
	canEditOwnEntryFile TINYINT(1) NOT NULL DEFAULT -1,
	canDeleteOwnEntryFile TINYINT(1) NOT NULL DEFAULT -1,
	PRIMARY KEY (userID, categoryID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_entry;
CREATE TABLE wsif1_1_entry (
	entryID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	categoryID INT(10) NOT NULL DEFAULT 0,
	languageID INT(10) NOT NULL DEFAULT 0,
	prefixID INT(10) NOT NULL DEFAULT 0,
	userID INT(10) NOT NULL DEFAULT 0,
	username VARCHAR(255) NOT NULL DEFAULT '',
	subject VARCHAR(255) NOT NULL DEFAULT '',
	message MEDIUMTEXT NOT NULL,
	teaser TINYTEXT,
	time INT(10) NOT NULL DEFAULT 0,
	defaultImageID INT(10) NOT NULL DEFAULT 0,
	defaultFileID INT(10) NOT NULL DEFAULT 0,
	images MEDIUMINT(7) NOT NULL DEFAULT 0,
	files MEDIUMINT(7) NOT NULL DEFAULT 0,
	downloads MEDIUMINT(7) NOT NULL DEFAULT 0,
	views MEDIUMINT(7) NOT NULL DEFAULT 0,
	ratings SMALLINT(5) NOT NULL DEFAULT 0,
	rating MEDIUMINT(7) NOT NULL DEFAULT 0,
	everEnabled TINYINT(1) NOT NULL DEFAULT 1,
	isDisabled TINYINT(1) NOT NULL DEFAULT 0,
	isDeleted TINYINT(1) NOT NULL DEFAULT 0,
	deleteTime INT(10) NOT NULL DEFAULT 0,
	deletedBy VARCHAR(255) NOT NULL DEFAULT '',
	deletedByID INT(10) NOT NULL DEFAULT 0,
	deleteReason TEXT,
	enableSmilies TINYINT(1) NOT NULL DEFAULT 1,
	enableHtml TINYINT(1) NOT NULL DEFAULT 0,
	enableBBCodes TINYINT(1) NOT NULL DEFAULT 1,
	ipAddress VARCHAR(15) NOT NULL DEFAULT '',
	FULLTEXT KEY (subject, message),
	KEY (languageID),
	KEY (categoryID, isDeleted, isDisabled, time),
	KEY (isDeleted),
	KEY (isDisabled),
	KEY (userID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_entry_comment;
CREATE TABLE wsif1_1_entry_comment (
	commentID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	entryID INT(10) NOT NULL DEFAULT 0,
	userID INT(10) NOT NULL DEFAULT 0,
	username VARCHAR(255) NOT NULL DEFAULT '',
	subject VARCHAR(255) NOT NULL DEFAULT '',
	message MEDIUMTEXT NOT NULL,
	time INT(10) NOT NULL DEFAULT 0,
	attachments SMALLINT(5) NOT NULL DEFAULT 0,
	enableSmilies TINYINT(1) NOT NULL DEFAULT 1,
	enableHtml TINYINT(1) NOT NULL DEFAULT 0,
	enableBBCodes TINYINT(1) NOT NULL DEFAULT 1,
	ipAddress VARCHAR(15) NOT NULL DEFAULT '',
	KEY (entryID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_entry_file;
CREATE TABLE wsif1_1_entry_file (
	fileID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	entryID INT(10) NOT NULL DEFAULT 0,
	userID INT(10) NOT NULL DEFAULT 0,
	username VARCHAR(255) NOT NULL DEFAULT '',
	isDefault TINYINT(1) NOT NULL DEFAULT 0,
	title VARCHAR(255) NOT NULL DEFAULT '',
	description MEDIUMTEXT,
	fileType TINYINT(1) NOT NULL DEFAULT 0,
	filename VARCHAR(255) NOT NULL DEFAULT '',
	filesize INT(20) NOT NULL DEFAULT 0,
	externalURL VARCHAR(255) NOT NULL DEFAULT '',
	mimeType VARCHAR(255) NOT NULL DEFAULT '',
	uploadTime INT(10) NOT NULL DEFAULT 0,
	views MEDIUMINT(7) NOT NULL DEFAULT 0,
	downloads MEDIUMINT(7) NOT NULL DEFAULT 0,
	lastDownloadTime INT(10) NOT NULL DEFAULT 0,
	sha1Hash VARCHAR(40) NOT NULL DEFAULT '',
	ipAddress VARCHAR(15) NOT NULL DEFAULT '',
	KEY (entryID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_entry_file_downloader;
CREATE TABLE wsif1_1_entry_file_downloader (
	fileID INT(10) NOT NULL,
	userID INT(10) NOT NULL DEFAULT 0,
	time INT(10) NOT NULL DEFAULT 0,
	UNIQUE KEY (fileID, userID),
	KEY (time)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_entry_image;
CREATE TABLE wsif1_1_entry_image (
	imageID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	entryID INT(10) NOT NULL DEFAULT 0,
	userID INT(10) NOT NULL DEFAULT 0,
	username VARCHAR(255) NOT NULL DEFAULT '',
	isDefault TINYINT(1) NOT NULL DEFAULT 0,
	title VARCHAR(255) NOT NULL DEFAULT '',
	description TEXT NULL,
	filename VARCHAR(255) NOT NULL DEFAULT '',
	filesize INT(10) NOT NULL DEFAULT 0,
	mimeType VARCHAR(255) NOT NULL DEFAULT '',
	uploadTime INT(10) NOT NULL DEFAULT 0,
	width SMALLINT(5) NOT NULL DEFAULT 0,
	height SMALLINT(5) NOT NULL DEFAULT 0,
	hasThumbnail VARCHAR(255) NOT NULL DEFAULT '',
	thumbnailMimeType VARCHAR(255) NOT NULL DEFAULT '',
	thumbnailFilesize INT(10) NOT NULL DEFAULT 0,
	thumbnailWidth SMALLINT(5) NOT NULL DEFAULT 0,
	thumbnailHeight SMALLINT(5) NOT NULL DEFAULT 0,
	views MEDIUMINT(8) NOT NULL DEFAULT 0,
	ipAddress VARCHAR(15) NOT NULL DEFAULT '',
	KEY (entryID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_entry_menu_item;
CREATE TABLE wsif1_1_entry_menu_item (
	menuItemID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	packageID INT(10) NOT NULL DEFAULT 0,
	menuItem VARCHAR(255) NOT NULL DEFAULT '',
	parentMenuItem VARCHAR(255) NOT NULL DEFAULT '',
	menuItemLink VARCHAR(255) NOT NULL DEFAULT '',
	menuItemIcon VARCHAR(255) NOT NULL DEFAULT '',
	showOrder INT(10) NOT NULL DEFAULT 0,
	permissions TEXT,
	options TEXT,
	UNIQUE KEY (menuItem, packageID)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_entry_prefix;
CREATE TABLE wsif1_1_entry_prefix (
	prefixID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	prefix VARCHAR(255) NOT NULL DEFAULT '',
	prefixMarking VARCHAR(255) NOT NULL DEFAULT '%s',
	prefixType TINYINT(1) NOT NULL DEFAULT 0,
	showOrder INT(10) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_entry_prefix_to_category;
CREATE TABLE wsif1_1_entry_prefix_to_category (
	categoryID INT(10) NOT NULL,
	prefixID INT(10) NOT NULL,
	PRIMARY KEY (categoryID, prefixID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_entry_rating;
CREATE TABLE wsif1_1_entry_rating (
	entryID INT(10) NOT NULL DEFAULT 0,
	rating INT(10) NOT NULL DEFAULT 0,
	userID INT(10) NOT NULL DEFAULT 0,
	ipAddress VARCHAR(15) NOT NULL DEFAULT '',
	KEY (entryID, userID),
	KEY (entryID, ipAddress)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_entry_visitor;
CREATE TABLE wsif1_1_entry_visitor (
	entryID INT(10) NOT NULL,
	userID INT(10) NOT NULL DEFAULT 0,
	time INT(10) NOT NULL DEFAULT 0,
	UNIQUE KEY (entryID, userID),
	KEY (time)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS wsif1_1_user;
CREATE TABLE wsif1_1_user (
	userID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	entries SMALLINT(5) NOT NULL DEFAULT 0,
	KEY (entries)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;