-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2015 at 01:03 PM
-- Server version: 5.6.17-log
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `moodle`
--

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  `markingworkflow` tinyint(2) NOT NULL DEFAULT '0',
  `markingallocation` tinyint(2) NOT NULL DEFAULT '0',
  `sendstudentnotifications` tinyint(2) NOT NULL DEFAULT '1',
  `preventsubmissionnotingroup` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table saves information about an instance of mod_assign' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text feedback for submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_annot`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_annot` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `endx` bigint(10) DEFAULT '0',
  `endy` bigint(10) DEFAULT '0',
  `path` longtext,
  `type` varchar(10) DEFAULT 'line',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditanno_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores annotations added to pdfs submitted by students' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_cmnt`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_cmnt` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `width` bigint(10) DEFAULT '120',
  `rawtext` longtext,
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditcmnt_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores comments added to pdfs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_quick`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_quick` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `rawtext` longtext NOT NULL,
  `width` bigint(10) NOT NULL DEFAULT '120',
  `colour` varchar(10) DEFAULT 'yellow',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditquic_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores teacher specified quicklist comments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores info about the number of files submitted by a student' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext,
  `data2` longtext,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_upgrade`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_upgrade` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `oldcmid` bigint(10) NOT NULL DEFAULT '0',
  `oldinstance` bigint(10) NOT NULL DEFAULT '0',
  `newcmid` bigint(10) NOT NULL DEFAULT '0',
  `newinstance` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiupgr_old_ix` (`oldcmid`),
  KEY `mdl_assiupgr_old2_ix` (`oldinstance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about upgraded assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about file submissions for assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about onlinetext submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  KEY `mdl_assigrad_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading information about a single assignment submission.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_plugin_config`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) NOT NULL DEFAULT '',
  `subtype` varchar(28) NOT NULL DEFAULT '',
  `name` varchar(28) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Config data for an instance of a plugin in an assignment.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  `latest` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  KEY `mdl_assisubm_assusegrolat_ix` (`assignment`,`userid`,`groupid`,`latest`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about student interactions with' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) DEFAULT NULL,
  `allocatedmarker` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  KEY `mdl_assiuserflag_use_ix` (`userid`),
  KEY `mdl_assiuserflag_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of flags that can be set for a single user in a single ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_mapping`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Map an assignment specific id number to a user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_controllers`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `operation` varchar(20) NOT NULL DEFAULT 'backup',
  `type` varchar(10) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store the backup_controllers as they are used' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) NOT NULL DEFAULT '5',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store every course backup status' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_logs`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all the logs from backup and restore operations (by' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge`
--

CREATE TABLE IF NOT EXISTS `mdl_badge` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) NOT NULL DEFAULT '',
  `issuerurl` varchar(255) NOT NULL DEFAULT '',
  `issuercontact` varchar(255) DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext NOT NULL,
  `messagesubject` longtext NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badg_typ_ix` (`type`),
  KEY `mdl_badg_cou_ix` (`courseid`),
  KEY `mdl_badg_use_ix` (`usermodified`),
  KEY `mdl_badg_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines badge' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_backpack`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `backpackurl` varchar(255) NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgback_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines settings for connecting external backpack' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  KEY `mdl_badgcrit_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines criteria for issuing badges' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_met`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritmet_cri_ix` (`critid`),
  KEY `mdl_badgcritmet_use_ix` (`userid`),
  KEY `mdl_badgcritmet_iss_ix` (`issuedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines criteria that were met for an issued badge' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_param`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritpara_cri_ix` (`critid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines parameters for badges criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_external`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgexte_bac_ix` (`backpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Setting for external badges display' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_issued`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_issued` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  KEY `mdl_badgissu_bad_ix` (`badgeid`),
  KEY `mdl_badgissu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines issued badges' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_manual_award`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track manual award criteria for badges' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block`
--

CREATE TABLE IF NOT EXISTS `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='contains all installed blocks' AUTO_INCREMENT=45 ;

--
-- Dumping data for table `mdl_block`
--

INSERT INTO `mdl_block` (`id`, `name`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 0, 0, 1),
(2, 'activity_results', 0, 0, 1),
(3, 'admin_bookmarks', 0, 0, 1),
(4, 'badges', 0, 0, 1),
(5, 'blog_menu', 0, 0, 1),
(6, 'blog_recent', 0, 0, 1),
(7, 'blog_tags', 0, 0, 1),
(8, 'calendar_month', 0, 0, 1),
(9, 'calendar_upcoming', 0, 0, 1),
(10, 'comments', 0, 0, 1),
(11, 'community', 0, 0, 1),
(12, 'completionstatus', 0, 0, 1),
(13, 'course_list', 0, 0, 1),
(14, 'course_overview', 0, 0, 1),
(15, 'course_summary', 0, 0, 1),
(16, 'feedback', 0, 0, 0),
(17, 'glossary_random', 0, 0, 1),
(18, 'html', 0, 0, 1),
(19, 'login', 0, 0, 1),
(20, 'mentees', 0, 0, 1),
(21, 'messages', 0, 0, 1),
(22, 'mnet_hosts', 0, 0, 1),
(23, 'myprofile', 0, 0, 1),
(24, 'navigation', 0, 0, 1),
(25, 'news_items', 0, 0, 1),
(26, 'online_users', 0, 0, 1),
(27, 'participants', 0, 0, 1),
(28, 'private_files', 0, 0, 1),
(29, 'quiz_results', 0, 0, 0),
(30, 'recent_activity', 86400, 0, 1),
(31, 'rss_client', 300, 0, 1),
(32, 'search_forums', 0, 0, 1),
(33, 'section_links', 0, 0, 1),
(34, 'selfcompletion', 0, 0, 1),
(35, 'settings', 0, 0, 1),
(36, 'site_main_menu', 0, 0, 1),
(37, 'social_activities', 0, 0, 1),
(38, 'tag_flickr', 0, 0, 1),
(39, 'tag_youtube', 0, 0, 1),
(40, 'tags', 0, 0, 1),
(41, 'faces', 0, 0, 1),
(42, 'font_recents', 0, 0, 1),
(43, 'userinfo', 0, 0, 1),
(44, 'slideshow', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_community`
--

CREATE TABLE IF NOT EXISTS `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) NOT NULL DEFAULT '',
  `coursedescription` longtext,
  `courseurl` varchar(255) NOT NULL DEFAULT '',
  `imageurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Community block' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) DEFAULT NULL,
  `defaultregion` varchar(16) NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores block instances. The type of block this is' AUTO_INCREMENT=40 ;

--
-- Dumping data for table `mdl_block_instances`
--

INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`) VALUES
(1, 'site_main_menu', 2, 0, 'site-index', NULL, 'side-pre', 0, ''),
(2, 'course_summary', 2, 0, 'site-index', NULL, 'side-pre', 3, ''),
(3, 'calendar_month', 2, 0, 'site-index', NULL, 'side-post', 1, ''),
(4, 'navigation', 1, 1, '*', NULL, 'side-pre', 0, ''),
(5, 'settings', 1, 1, '*', NULL, 'side-pre', 1, ''),
(6, 'admin_bookmarks', 1, 0, 'admin-*', NULL, 'side-pre', 2, ''),
(7, 'private_files', 1, 0, 'my-index', '2', 'side-post', 0, ''),
(8, 'online_users', 1, 0, 'my-index', '2', 'side-post', 1, ''),
(9, 'badges', 1, 0, 'my-index', '2', 'side-post', 2, ''),
(10, 'calendar_month', 1, 0, 'my-index', '2', 'side-post', 3, ''),
(11, 'calendar_upcoming', 1, 0, 'my-index', '2', 'side-post', 4, ''),
(12, 'course_overview', 1, 0, 'my-index', '2', 'content', 0, ''),
(13, 'private_files', 5, 0, 'my-index', '3', 'side-post', 0, ''),
(14, 'online_users', 5, 0, 'my-index', '3', 'side-post', 1, ''),
(15, 'badges', 5, 0, 'my-index', '3', 'side-post', 2, ''),
(16, 'calendar_month', 5, 0, 'my-index', '3', 'side-post', 3, ''),
(17, 'calendar_upcoming', 5, 0, 'my-index', '3', 'side-post', 4, ''),
(18, 'course_overview', 5, 0, 'my-index', '3', 'content', 0, ''),
(19, 'course_list', 5, 0, 'my-index', '3', 'side-pre', 2, ''),
(20, 'badges', 5, 0, 'my-index', '3', 'side-pre', 3, ''),
(21, 'search_forums', 27, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(22, 'news_items', 27, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(23, 'calendar_upcoming', 27, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(24, 'recent_activity', 27, 0, 'course-view-*', NULL, 'side-post', 3, ''),
(25, 'html', 5, 0, 'my-index', NULL, 'side-pre', 4, 'Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJ0aXRsZSI7czo5OiJUZXN0IGh0bWwiO3M6NjoiZm9ybWF0IjtzOjE6IjEiO3M6NDoidGV4dCI7czoxODoiPGI+SGVsbG8gV29ybGQ8L2I+Ijt9'),
(26, 'font_recents', 2, 0, 'site-index', NULL, 'font-recents', 0, ''),
(27, 'search_forums', 36, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(28, 'news_items', 36, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(29, 'calendar_upcoming', 36, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(30, 'recent_activity', 36, 0, 'course-view-*', NULL, 'side-post', 3, ''),
(31, 'search_forums', 41, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(32, 'news_items', 41, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(33, 'calendar_upcoming', 41, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(34, 'recent_activity', 41, 0, 'course-view-*', NULL, 'side-post', 3, ''),
(35, 'course_list', 2, 0, 'site-index', NULL, 'side-pre', 2, ''),
(36, 'search_forums', 49, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(37, 'news_items', 49, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(38, 'calendar_upcoming', 49, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(39, 'recent_activity', 49, 0, 'course-view-*', NULL, 'side-post', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_positions`
--

CREATE TABLE IF NOT EXISTS `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) NOT NULL DEFAULT '',
  `subpage` varchar(16) NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the position of a sticky block_instance on a another ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_recent_activity`
--

CREATE TABLE IF NOT EXISTS `mdl_block_recent_activity` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `action` tinyint(1) NOT NULL,
  `modname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blocreceacti_coutim_ix` (`courseid`,`timecreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Recent activity block' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_rss_client`
--

CREATE TABLE IF NOT EXISTS `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext NOT NULL,
  `preferredtitle` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Remote news feed information. Contains the news feed id, the' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_xp`
--

CREATE TABLE IF NOT EXISTS `mdl_block_xp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `xp` bigint(20) NOT NULL,
  `lvl` bigint(10) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocxp_couuse_uix` (`courseid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='XP points earned' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_xp_config`
--

CREATE TABLE IF NOT EXISTS `mdl_block_xp_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `enablelog` tinyint(1) NOT NULL,
  `keeplogs` bigint(10) NOT NULL,
  `levels` bigint(10) NOT NULL,
  `lastlogpurge` bigint(10) NOT NULL DEFAULT '0',
  `enableladder` tinyint(1) NOT NULL DEFAULT '1',
  `enableinfos` tinyint(1) NOT NULL DEFAULT '1',
  `levelsdata` longtext,
  `enablelevelupnotif` tinyint(1) NOT NULL DEFAULT '1',
  `enablecustomlevelbadges` tinyint(1) NOT NULL DEFAULT '0',
  `maxactionspertime` bigint(10) NOT NULL DEFAULT '10',
  `timeformaxactions` bigint(10) NOT NULL DEFAULT '60',
  `timebetweensameactions` bigint(10) NOT NULL DEFAULT '180',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocxpconf_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Settings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_xp_filters`
--

CREATE TABLE IF NOT EXISTS `mdl_block_xp_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `ruledata` longtext NOT NULL,
  `points` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blocxpfilt_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Filters' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_xp_log`
--

CREATE TABLE IF NOT EXISTS `mdl_block_xp_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `eventname` varchar(255) NOT NULL DEFAULT '',
  `xp` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blocxplog_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_blocxplog_tim_ix` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Events captured' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_association`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associations of blog entries with courses and module instanc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_external`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `url` longtext NOT NULL,
  `filtertags` varchar(255) DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='External blog links used for RSS copying of blog entries to ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book`
--

CREATE TABLE IF NOT EXISTS `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `navstyle` smallint(4) NOT NULL DEFAULT '1',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book_chapters`
--

CREATE TABLE IF NOT EXISTS `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book_chapters' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_filters`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `rawtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping information about cached data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Cache of time-sensitive flags' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `mdl_cache_flags`
--

INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1436931546, '1', 1436938746),
(2, 'accesslib/dirtycontexts', '/1/26', 1435141737, '1', 1435148937),
(3, 'accesslib/dirtycontexts', '/1/26/27', 1435141850, '1', 1435149050),
(4, 'accesslib/dirtycontexts', '/1/26/36', 1436943142, '1', 1436950342),
(5, 'accesslib/dirtycontexts', '/1/26/41', 1436943294, '1', 1436950494),
(6, 'accesslib/dirtycontexts', '/1/26/49', 1436958116, '1', 1436965316);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `captype` varchar(50) NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines all capabilities' AUTO_INCREMENT=533 ;

--
-- Dumping data for table `mdl_capabilities`
--

INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(3, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(4, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(5, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(6, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(7, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(8, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(9, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(10, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(12, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(13, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(14, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(15, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(16, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(17, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(18, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(23, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(24, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(25, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(26, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(27, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(28, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
(29, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(30, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(31, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(32, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(33, 'moodle/user:create', 'write', 10, 'moodle', 24),
(34, 'moodle/user:delete', 'write', 10, 'moodle', 8),
(35, 'moodle/user:update', 'write', 10, 'moodle', 24),
(36, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(37, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(38, 'moodle/user:viewlastip', 'read', 30, 'moodle', 8),
(39, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(40, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(41, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(42, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(43, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(44, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(45, 'moodle/user:ignoreuserquota', 'write', 10, 'moodle', 0),
(46, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(47, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(48, 'moodle/role:review', 'read', 50, 'moodle', 8),
(49, 'moodle/role:override', 'write', 50, 'moodle', 28),
(50, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(51, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(52, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(53, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(54, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(55, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(56, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(57, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(58, 'moodle/course:create', 'write', 40, 'moodle', 4),
(59, 'moodle/course:request', 'write', 10, 'moodle', 0),
(60, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(61, 'moodle/course:update', 'write', 50, 'moodle', 4),
(62, 'moodle/course:view', 'read', 50, 'moodle', 0),
(63, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(64, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(65, 'moodle/course:reviewotherusers', 'read', 50, 'moodle', 0),
(66, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(67, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(68, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(69, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(70, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(71, 'moodle/course:ignorefilesizelimits', 'write', 50, 'moodle', 0),
(72, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
(73, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
(74, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
(75, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(76, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(77, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(78, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(79, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(80, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(81, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(82, 'moodle/course:isincompletionreports', 'read', 50, 'moodle', 0),
(83, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(84, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(85, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(86, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(87, 'moodle/course:viewsuspendedusers', 'read', 10, 'moodle', 0),
(88, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(89, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(90, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(91, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(92, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(93, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(94, 'moodle/blog:associatecourse', 'write', 50, 'moodle', 0),
(95, 'moodle/blog:associatemodule', 'write', 70, 'moodle', 0),
(96, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(97, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(98, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(99, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(100, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(101, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(102, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(103, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(104, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(105, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(106, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(107, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(108, 'moodle/question:add', 'write', 50, 'moodle', 20),
(109, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(110, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(111, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(112, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(113, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(114, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(115, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(116, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(117, 'moodle/question:config', 'write', 10, 'moodle', 2),
(118, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(119, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(120, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(121, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(122, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(123, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(124, 'moodle/course:movesections', 'write', 50, 'moodle', 0),
(125, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(126, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(127, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(128, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(129, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(130, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(131, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(132, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(133, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
(134, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
(135, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
(136, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(137, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(138, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(139, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(140, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(141, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(142, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(143, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(144, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(145, 'moodle/tag:create', 'write', 10, 'moodle', 16),
(146, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(147, 'moodle/tag:flag', 'write', 10, 'moodle', 16),
(148, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(149, 'moodle/block:view', 'read', 80, 'moodle', 0),
(150, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(151, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(152, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(153, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(154, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(155, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(156, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
(157, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(158, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(159, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(160, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(161, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(162, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(163, 'moodle/community:add', 'write', 10, 'moodle', 0),
(164, 'moodle/community:download', 'write', 10, 'moodle', 0),
(165, 'moodle/badges:manageglobalsettings', 'write', 10, 'moodle', 34),
(166, 'moodle/badges:viewbadges', 'read', 50, 'moodle', 0),
(167, 'moodle/badges:manageownbadges', 'write', 30, 'moodle', 0),
(168, 'moodle/badges:viewotherbadges', 'read', 30, 'moodle', 0),
(169, 'moodle/badges:earnbadge', 'write', 50, 'moodle', 0),
(170, 'moodle/badges:createbadge', 'write', 50, 'moodle', 16),
(171, 'moodle/badges:deletebadge', 'write', 50, 'moodle', 32),
(172, 'moodle/badges:configuredetails', 'write', 50, 'moodle', 16),
(173, 'moodle/badges:configurecriteria', 'write', 50, 'moodle', 4),
(174, 'moodle/badges:configuremessages', 'write', 50, 'moodle', 16),
(175, 'moodle/badges:awardbadge', 'write', 50, 'moodle', 16),
(176, 'moodle/badges:viewawarded', 'read', 50, 'moodle', 8),
(177, 'moodle/site:forcelanguage', 'read', 10, 'moodle', 0),
(178, 'mod/assign:view', 'read', 70, 'mod_assign', 0),
(179, 'mod/assign:submit', 'write', 70, 'mod_assign', 0),
(180, 'mod/assign:grade', 'write', 70, 'mod_assign', 4),
(181, 'mod/assign:exportownsubmission', 'read', 70, 'mod_assign', 0),
(182, 'mod/assign:addinstance', 'write', 50, 'mod_assign', 4),
(183, 'mod/assign:editothersubmission', 'write', 70, 'mod_assign', 41),
(184, 'mod/assign:grantextension', 'write', 70, 'mod_assign', 0),
(185, 'mod/assign:revealidentities', 'write', 70, 'mod_assign', 0),
(186, 'mod/assign:reviewgrades', 'write', 70, 'mod_assign', 0),
(187, 'mod/assign:releasegrades', 'write', 70, 'mod_assign', 0),
(188, 'mod/assign:managegrades', 'write', 70, 'mod_assign', 0),
(189, 'mod/assign:manageallocations', 'write', 70, 'mod_assign', 0),
(190, 'mod/assign:viewgrades', 'read', 70, 'mod_assign', 0),
(191, 'mod/assign:viewblinddetails', 'write', 70, 'mod_assign', 8),
(192, 'mod/assign:receivegradernotifications', 'read', 70, 'mod_assign', 0),
(193, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(194, 'mod/assignment:addinstance', 'write', 50, 'mod_assignment', 4),
(195, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(196, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(197, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(198, 'mod/book:addinstance', 'write', 50, 'mod_book', 4),
(199, 'mod/book:read', 'read', 70, 'mod_book', 0),
(200, 'mod/book:viewhiddenchapters', 'read', 70, 'mod_book', 0),
(201, 'mod/book:edit', 'write', 70, 'mod_book', 4),
(202, 'mod/chat:addinstance', 'write', 50, 'mod_chat', 4),
(203, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(204, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(205, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(206, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(207, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(208, 'mod/choice:addinstance', 'write', 50, 'mod_choice', 4),
(209, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(210, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(211, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(212, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(213, 'mod/data:addinstance', 'write', 50, 'mod_data', 4),
(214, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(215, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(216, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(217, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(218, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(219, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(220, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(221, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(222, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(223, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(224, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(225, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(226, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(227, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(228, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(229, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(230, 'mod/data:exportuserinfo', 'read', 70, 'mod_data', 8),
(231, 'mod/feedback:addinstance', 'write', 50, 'mod_feedback', 4),
(232, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(233, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(234, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(235, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(236, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(237, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(238, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(239, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(240, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(241, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(242, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(243, 'mod/folder:addinstance', 'write', 50, 'mod_folder', 4),
(244, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(245, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(246, 'mod/forum:addinstance', 'write', 50, 'mod_forum', 4),
(247, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(248, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(249, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(250, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(251, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(252, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(253, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(254, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(255, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(256, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(257, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(258, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(259, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(260, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(261, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(262, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(263, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(264, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(265, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(266, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(267, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(268, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(269, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(270, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
(271, 'mod/forum:allowforcesubscribe', 'read', 70, 'mod_forum', 0),
(272, 'mod/forum:canposttomygroups', 'write', 70, 'mod_forum', 0),
(273, 'mod/glossary:addinstance', 'write', 50, 'mod_glossary', 4),
(274, 'mod/glossary:view', 'read', 70, 'mod_glossary', 0),
(275, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(276, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(277, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(278, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(279, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(280, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(281, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(282, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(283, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(284, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(285, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(286, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(287, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(288, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(289, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(290, 'mod/imscp:addinstance', 'write', 50, 'mod_imscp', 4),
(291, 'mod/label:addinstance', 'write', 50, 'mod_label', 4),
(292, 'mod/lesson:addinstance', 'write', 50, 'mod_lesson', 4),
(293, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(294, 'mod/lesson:grade', 'write', 70, 'mod_lesson', 20),
(295, 'mod/lesson:viewreports', 'read', 70, 'mod_lesson', 8),
(296, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(297, 'mod/lesson:manageoverrides', 'write', 70, 'mod_lesson', 0),
(298, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
(299, 'mod/lti:addinstance', 'write', 50, 'mod_lti', 4),
(300, 'mod/lti:manage', 'write', 70, 'mod_lti', 8),
(301, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
(302, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
(303, 'mod/page:view', 'read', 70, 'mod_page', 0),
(304, 'mod/page:addinstance', 'write', 50, 'mod_page', 4),
(305, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(306, 'mod/quiz:addinstance', 'write', 50, 'mod_quiz', 4),
(307, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(308, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(309, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(310, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(311, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(312, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 20),
(313, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(314, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(315, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(316, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(317, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(318, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(319, 'mod/quiz:emailwarnoverdue', 'read', 70, 'mod_quiz', 0),
(320, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(321, 'mod/resource:addinstance', 'write', 50, 'mod_resource', 4),
(322, 'mod/scorm:addinstance', 'write', 50, 'mod_scorm', 4),
(323, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(324, 'mod/scorm:skipview', 'read', 70, 'mod_scorm', 0),
(325, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(326, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(327, 'mod/scorm:deleteresponses', 'write', 70, 'mod_scorm', 0),
(328, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
(329, 'mod/survey:addinstance', 'write', 50, 'mod_survey', 4),
(330, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(331, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(332, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(333, 'mod/url:view', 'read', 70, 'mod_url', 0),
(334, 'mod/url:addinstance', 'write', 50, 'mod_url', 4),
(335, 'mod/wiki:addinstance', 'write', 50, 'mod_wiki', 4),
(336, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(337, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(338, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(339, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(340, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(341, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(342, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(343, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(344, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(345, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(346, 'mod/workshop:addinstance', 'write', 50, 'mod_workshop', 4),
(347, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(348, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(349, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(350, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(351, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(352, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(353, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(354, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(355, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(356, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(357, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(358, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(359, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(360, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(361, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(362, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(363, 'enrol/category:config', 'write', 50, 'enrol_category', 0),
(364, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(365, 'enrol/cohort:unenrol', 'write', 50, 'enrol_cohort', 0),
(366, 'enrol/database:unenrol', 'write', 50, 'enrol_database', 0),
(367, 'enrol/database:config', 'write', 50, 'enrol_database', 0),
(368, 'enrol/flatfile:manage', 'write', 50, 'enrol_flatfile', 0),
(369, 'enrol/flatfile:unenrol', 'write', 50, 'enrol_flatfile', 0),
(370, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(371, 'enrol/imsenterprise:config', 'write', 50, 'enrol_imsenterprise', 0),
(372, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(373, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(374, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(375, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(376, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(377, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(378, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(379, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(380, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
(381, 'enrol/mnet:config', 'write', 50, 'enrol_mnet', 0),
(382, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(383, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(384, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(385, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(386, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(387, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(388, 'enrol/self:holdkey', 'write', 50, 'enrol_self', 0),
(389, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(390, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(391, 'message/airnotifier:managedevice', 'write', 10, 'message_airnotifier', 0),
(392, 'block/activity_modules:addinstance', 'write', 80, 'block_activity_modules', 20),
(393, 'block/activity_results:addinstance', 'write', 80, 'block_activity_results', 20),
(394, 'block/admin_bookmarks:myaddinstance', 'write', 10, 'block_admin_bookmarks', 0),
(395, 'block/admin_bookmarks:addinstance', 'write', 80, 'block_admin_bookmarks', 20),
(396, 'block/badges:addinstance', 'read', 80, 'block_badges', 0),
(397, 'block/badges:myaddinstance', 'read', 10, 'block_badges', 8),
(398, 'block/blog_menu:addinstance', 'write', 80, 'block_blog_menu', 20),
(399, 'block/blog_recent:addinstance', 'write', 80, 'block_blog_recent', 20),
(400, 'block/blog_tags:addinstance', 'write', 80, 'block_blog_tags', 20),
(401, 'block/calendar_month:myaddinstance', 'write', 10, 'block_calendar_month', 0),
(402, 'block/calendar_month:addinstance', 'write', 80, 'block_calendar_month', 20),
(403, 'block/calendar_upcoming:myaddinstance', 'write', 10, 'block_calendar_upcoming', 0),
(404, 'block/calendar_upcoming:addinstance', 'write', 80, 'block_calendar_upcoming', 20),
(405, 'block/comments:myaddinstance', 'write', 10, 'block_comments', 0),
(406, 'block/comments:addinstance', 'write', 80, 'block_comments', 20),
(407, 'block/community:myaddinstance', 'write', 10, 'block_community', 0),
(408, 'block/community:addinstance', 'write', 80, 'block_community', 20),
(409, 'block/completionstatus:addinstance', 'write', 80, 'block_completionstatus', 20),
(410, 'block/course_list:myaddinstance', 'write', 10, 'block_course_list', 0),
(411, 'block/course_list:addinstance', 'write', 80, 'block_course_list', 20),
(412, 'block/course_overview:myaddinstance', 'write', 10, 'block_course_overview', 0),
(413, 'block/course_overview:addinstance', 'write', 80, 'block_course_overview', 20),
(414, 'block/course_summary:addinstance', 'write', 80, 'block_course_summary', 20),
(415, 'block/feedback:addinstance', 'write', 80, 'block_feedback', 20),
(416, 'block/glossary_random:myaddinstance', 'write', 10, 'block_glossary_random', 0),
(417, 'block/glossary_random:addinstance', 'write', 80, 'block_glossary_random', 20),
(418, 'block/html:myaddinstance', 'write', 10, 'block_html', 0),
(419, 'block/html:addinstance', 'write', 80, 'block_html', 20),
(420, 'block/login:addinstance', 'write', 80, 'block_login', 20),
(421, 'block/mentees:myaddinstance', 'write', 10, 'block_mentees', 0),
(422, 'block/mentees:addinstance', 'write', 80, 'block_mentees', 20),
(423, 'block/messages:myaddinstance', 'write', 10, 'block_messages', 0),
(424, 'block/messages:addinstance', 'write', 80, 'block_messages', 20),
(425, 'block/mnet_hosts:myaddinstance', 'write', 10, 'block_mnet_hosts', 0),
(426, 'block/mnet_hosts:addinstance', 'write', 80, 'block_mnet_hosts', 20),
(427, 'block/myprofile:myaddinstance', 'write', 10, 'block_myprofile', 0),
(428, 'block/myprofile:addinstance', 'write', 80, 'block_myprofile', 20),
(429, 'block/navigation:myaddinstance', 'write', 10, 'block_navigation', 0),
(430, 'block/navigation:addinstance', 'write', 80, 'block_navigation', 20),
(431, 'block/news_items:myaddinstance', 'write', 10, 'block_news_items', 0),
(432, 'block/news_items:addinstance', 'write', 80, 'block_news_items', 20),
(433, 'block/online_users:myaddinstance', 'write', 10, 'block_online_users', 0),
(434, 'block/online_users:addinstance', 'write', 80, 'block_online_users', 20),
(435, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(436, 'block/participants:addinstance', 'write', 80, 'block_participants', 20),
(437, 'block/private_files:myaddinstance', 'write', 10, 'block_private_files', 0),
(438, 'block/private_files:addinstance', 'write', 80, 'block_private_files', 20),
(439, 'block/quiz_results:addinstance', 'write', 80, 'block_quiz_results', 20),
(440, 'block/recent_activity:addinstance', 'write', 80, 'block_recent_activity', 20),
(441, 'block/recent_activity:viewaddupdatemodule', 'read', 50, 'block_recent_activity', 0),
(442, 'block/recent_activity:viewdeletemodule', 'read', 50, 'block_recent_activity', 0),
(443, 'block/rss_client:myaddinstance', 'write', 10, 'block_rss_client', 0),
(444, 'block/rss_client:addinstance', 'write', 80, 'block_rss_client', 20),
(445, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(446, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(447, 'block/search_forums:addinstance', 'write', 80, 'block_search_forums', 20),
(448, 'block/section_links:addinstance', 'write', 80, 'block_section_links', 20),
(449, 'block/selfcompletion:addinstance', 'write', 80, 'block_selfcompletion', 20),
(450, 'block/settings:myaddinstance', 'write', 10, 'block_settings', 0),
(451, 'block/settings:addinstance', 'write', 80, 'block_settings', 20),
(452, 'block/site_main_menu:addinstance', 'write', 80, 'block_site_main_menu', 20),
(453, 'block/social_activities:addinstance', 'write', 80, 'block_social_activities', 20),
(454, 'block/tag_flickr:addinstance', 'write', 80, 'block_tag_flickr', 20),
(455, 'block/tag_youtube:addinstance', 'write', 80, 'block_tag_youtube', 20),
(456, 'block/tags:myaddinstance', 'write', 10, 'block_tags', 0),
(457, 'block/tags:addinstance', 'write', 80, 'block_tags', 20),
(458, 'report/completion:view', 'read', 50, 'report_completion', 8),
(459, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(460, 'report/log:view', 'read', 50, 'report_log', 8),
(461, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
(462, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
(463, 'report/outline:view', 'read', 50, 'report_outline', 8),
(464, 'report/participation:view', 'read', 50, 'report_participation', 8),
(465, 'report/performance:view', 'read', 10, 'report_performance', 2),
(466, 'report/progress:view', 'read', 50, 'report_progress', 8),
(467, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(468, 'report/security:view', 'read', 10, 'report_security', 2),
(469, 'report/stats:view', 'read', 50, 'report_stats', 8),
(470, 'report/usersessions:manageownsessions', 'write', 30, 'report_usersessions', 0),
(471, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(472, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(473, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(474, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(475, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(476, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(477, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(478, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(479, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(480, 'gradeimport/direct:view', 'write', 50, 'gradeimport_direct', 0),
(481, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(482, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(483, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(484, 'gradereport/history:view', 'read', 50, 'gradereport_history', 8),
(485, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(486, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(487, 'gradereport/singleview:view', 'read', 50, 'gradereport_singleview', 8),
(488, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(489, 'webservice/amf:use', 'read', 50, 'webservice_amf', 62),
(490, 'webservice/rest:use', 'read', 50, 'webservice_rest', 62),
(491, 'webservice/soap:use', 'read', 50, 'webservice_soap', 62),
(492, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 62),
(493, 'repository/alfresco:view', 'read', 70, 'repository_alfresco', 0),
(494, 'repository/areafiles:view', 'read', 70, 'repository_areafiles', 0),
(495, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(496, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(497, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(498, 'repository/equella:view', 'read', 70, 'repository_equella', 0),
(499, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(500, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(501, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(502, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(503, 'repository/local:view', 'read', 70, 'repository_local', 0),
(504, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(505, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(506, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(507, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(508, 'repository/skydrive:view', 'read', 70, 'repository_skydrive', 0),
(509, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(510, 'repository/url:view', 'read', 70, 'repository_url', 0),
(511, 'repository/user:view', 'read', 70, 'repository_user', 0),
(512, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(513, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(514, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(515, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
(516, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
(517, 'tool/monitor:subscribe', 'read', 50, 'tool_monitor', 8),
(518, 'tool/monitor:managerules', 'write', 50, 'tool_monitor', 4),
(519, 'tool/monitor:managetool', 'write', 10, 'tool_monitor', 4),
(520, 'tool/uploaduser:uploaduserpictures', 'write', 10, 'tool_uploaduser', 16),
(521, 'booktool/exportimscp:export', 'read', 70, 'booktool_exportimscp', 0),
(522, 'booktool/importhtml:import', 'write', 70, 'booktool_importhtml', 4),
(523, 'booktool/print:print', 'read', 70, 'booktool_print', 0),
(524, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(525, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(526, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0),
(527, 'block/faces:myaddinstance', 'write', 10, 'block_faces', 0),
(528, 'block/faces:addinstance', 'write', 80, 'block_faces', 20),
(529, 'block/font_recents:myaddinstance', 'write', 10, 'block_font_recents', 0),
(530, 'block/font_recents:addinstance', 'write', 80, 'block_font_recents', 20),
(531, 'block/slideshow:myaddinstance', 'write', 10, 'block_slideshow', 0),
(532, 'block/slideshow:addinstance', 'write', 80, 'block_slideshow', 20);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat`
--

CREATE TABLE IF NOT EXISTS `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each of these is a chat room' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all the actual chat messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages_current`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores current session' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_users`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) NOT NULL DEFAULT '',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of which users are in which chat rooms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice`
--

CREATE TABLE IF NOT EXISTS `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `allowmultiple` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `includeinactive` tinyint(2) NOT NULL DEFAULT '1',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `showpreview` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available choices are stored here' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='choices performed by users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='available options to choice' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `component` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents one cohort (aka site-wide group).' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort_members`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a cohort.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) DEFAULT NULL,
  `commentarea` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle comments module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config`
--

CREATE TABLE IF NOT EXISTS `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Moodle configuration variables' AUTO_INCREMENT=476 ;

--
-- Dumping data for table `mdl_config`
--

INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'email'),
(4, 'auth_pop3mailbox', 'INBOX'),
(5, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
(6, 'theme', 'essential'),
(7, 'filter_multilang_converted', '1'),
(8, 'siteidentifier', 'wTRHnCuC8sBXzeXkPyBMeHiGLEKRhZkslocalhost'),
(9, 'backup_version', '2008111700'),
(10, 'backup_release', '2.0 dev'),
(11, 'mnet_dispatcher_mode', 'off'),
(12, 'sessiontimeout', '7200'),
(13, 'stringfilters', ''),
(14, 'filterall', '0'),
(15, 'texteditors', 'atto,tinymce,textarea'),
(16, 'upgrade_minmaxgradestepignored', '1'),
(17, 'mnet_localhost_id', '1'),
(18, 'mnet_all_hosts_id', '2'),
(19, 'siteguest', '1'),
(20, 'siteadmins', '2'),
(21, 'themerev', '1436945646'),
(22, 'jsrev', '1436945645'),
(23, 'gdversion', '2'),
(24, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(25, 'version', '2015051100.07'),
(26, 'enableoutcomes', '0'),
(27, 'usecomments', '1'),
(28, 'usetags', '1'),
(29, 'enablenotes', '1'),
(30, 'enableportfolios', '0'),
(31, 'enablewebservices', '0'),
(32, 'messaging', '1'),
(33, 'messaginghidereadnotifications', '0'),
(34, 'messagingdeletereadnotificationsdelay', '604800'),
(35, 'messagingallowemailoverride', '0'),
(36, 'enablestats', '0'),
(37, 'enablerssfeeds', '0'),
(38, 'enableblogs', '1'),
(39, 'enablecompletion', '0'),
(40, 'completiondefault', '1'),
(41, 'enableavailability', '0'),
(42, 'enableplagiarism', '0'),
(43, 'enablebadges', '1'),
(44, 'defaultpreference_maildisplay', '2'),
(45, 'defaultpreference_mailformat', '1'),
(46, 'defaultpreference_maildigest', '0'),
(47, 'defaultpreference_autosubscribe', '1'),
(48, 'defaultpreference_trackforums', '0'),
(49, 'autologinguests', '0'),
(50, 'hiddenuserfields', ''),
(51, 'showuseridentity', 'email'),
(52, 'fullnamedisplay', 'language'),
(53, 'alternativefullnameformat', 'language'),
(54, 'maxusersperpage', '100'),
(55, 'enablegravatar', '0'),
(56, 'gravatardefaulturl', 'mm'),
(57, 'enablecourserequests', '0'),
(58, 'defaultrequestcategory', '1'),
(59, 'requestcategoryselection', '0'),
(60, 'courserequestnotify', ''),
(61, 'grade_profilereport', 'user'),
(62, 'grade_aggregationposition', '1'),
(63, 'grade_includescalesinaggregation', '1'),
(64, 'grade_hiddenasdate', '0'),
(65, 'gradepublishing', '0'),
(66, 'grade_export_displaytype', '1'),
(67, 'grade_export_decimalpoints', '2'),
(68, 'grade_navmethod', '0'),
(69, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email'),
(70, 'grade_export_customprofilefields', ''),
(71, 'recovergradesdefault', '0'),
(72, 'gradeexport', ''),
(73, 'unlimitedgrades', '0'),
(74, 'grade_report_showmin', '1'),
(75, 'gradepointmax', '100'),
(76, 'gradepointdefault', '100'),
(77, 'grade_minmaxtouse', '1'),
(78, 'grade_mygrades_report', 'overview'),
(79, 'gradereport_mygradeurl', ''),
(80, 'grade_hideforcedsettings', '1'),
(81, 'grade_aggregation', '13'),
(82, 'grade_aggregation_flag', '0'),
(83, 'grade_aggregations_visible', '13'),
(84, 'grade_aggregateonlygraded', '1'),
(85, 'grade_aggregateonlygraded_flag', '2'),
(86, 'grade_aggregateoutcomes', '0'),
(87, 'grade_aggregateoutcomes_flag', '2'),
(88, 'grade_keephigh', '0'),
(89, 'grade_keephigh_flag', '3'),
(90, 'grade_droplow', '0'),
(91, 'grade_droplow_flag', '2'),
(92, 'grade_overridecat', '1'),
(93, 'grade_displaytype', '1'),
(94, 'grade_decimalpoints', '2'),
(95, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(96, 'grade_report_studentsperpage', '100'),
(97, 'grade_report_showonlyactiveenrol', '1'),
(98, 'grade_report_quickgrading', '1'),
(99, 'grade_report_showquickfeedback', '0'),
(100, 'grade_report_meanselection', '1'),
(101, 'grade_report_enableajax', '0'),
(102, 'grade_report_showcalculations', '1'),
(103, 'grade_report_showeyecons', '0'),
(104, 'grade_report_showaverages', '1'),
(105, 'grade_report_showlocks', '0'),
(106, 'grade_report_showranges', '0'),
(107, 'grade_report_showanalysisicon', '1'),
(108, 'grade_report_showuserimage', '1'),
(109, 'grade_report_showactivityicons', '1'),
(110, 'grade_report_shownumberofgrades', '0'),
(111, 'grade_report_averagesdisplaytype', 'inherit'),
(112, 'grade_report_rangesdisplaytype', 'inherit'),
(113, 'grade_report_averagesdecimalpoints', 'inherit'),
(114, 'grade_report_rangesdecimalpoints', 'inherit'),
(115, 'grade_report_historyperpage', '50'),
(116, 'grade_report_overview_showrank', '0'),
(117, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(118, 'grade_report_user_showrank', '0'),
(119, 'grade_report_user_showpercentage', '1'),
(120, 'grade_report_user_showgrade', '1'),
(121, 'grade_report_user_showfeedback', '1'),
(122, 'grade_report_user_showrange', '1'),
(123, 'grade_report_user_showweight', '1'),
(124, 'grade_report_user_showaverage', '0'),
(125, 'grade_report_user_showlettergrade', '0'),
(126, 'grade_report_user_rangedecimals', '0'),
(127, 'grade_report_user_showhiddenitems', '1'),
(128, 'grade_report_user_showtotalsifcontainhidden', '0'),
(129, 'grade_report_user_showcontributiontocoursetotal', '1'),
(130, 'badges_defaultissuername', ''),
(131, 'badges_defaultissuercontact', ''),
(132, 'badges_badgesalt', 'badges1435054157'),
(133, 'badges_allowexternalbackpack', '1'),
(134, 'badges_allowcoursebadges', '1'),
(136, 'forcetimezone', '99'),
(137, 'country', '0'),
(138, 'defaultcity', ''),
(139, 'geoipfile', 'F:\\wamp\\moodledata/geoip/GeoLiteCity.dat'),
(140, 'googlemapkey3', ''),
(141, 'allcountrycodes', ''),
(142, 'autolang', '1'),
(143, 'lang', 'en'),
(144, 'langmenu', '1'),
(145, 'langlist', ''),
(146, 'langrev', '1436945646'),
(147, 'langcache', '1'),
(148, 'langstringcache', '1'),
(149, 'locale', ''),
(150, 'latinexcelexport', '0'),
(151, 'requiremodintro', '0'),
(153, 'authloginviaemail', '0'),
(154, 'authpreventaccountcreation', '0'),
(155, 'loginpageautofocus', '0'),
(156, 'guestloginbutton', '1'),
(157, 'limitconcurrentlogins', '0'),
(158, 'alternateloginurl', ''),
(159, 'forgottenpasswordurl', ''),
(160, 'auth_instructions', ''),
(161, 'allowemailaddresses', ''),
(162, 'denyemailaddresses', ''),
(163, 'verifychangedemail', '1'),
(164, 'recaptchapublickey', ''),
(165, 'recaptchaprivatekey', ''),
(166, 'filteruploadedfiles', '0'),
(167, 'filtermatchoneperpage', '0'),
(168, 'filtermatchonepertext', '0'),
(169, 'sitedefaultlicense', 'allrightsreserved'),
(170, 'portfolio_moderate_filesize_threshold', '1048576'),
(171, 'portfolio_high_filesize_threshold', '5242880'),
(172, 'portfolio_moderate_db_threshold', '20'),
(173, 'portfolio_high_db_threshold', '50'),
(174, 'repositorycacheexpire', '120'),
(175, 'repositorygetfiletimeout', '30'),
(176, 'repositorysyncfiletimeout', '1'),
(177, 'repositorysyncimagetimeout', '3'),
(178, 'repositoryallowexternallinks', '1'),
(179, 'legacyfilesinnewcourses', '0'),
(180, 'legacyfilesaddallowed', '1'),
(181, 'mobilecssurl', ''),
(182, 'enablewsdocumentation', '0'),
(183, 'allowbeforeblock', '0'),
(184, 'allowedip', ''),
(185, 'blockedip', ''),
(186, 'protectusernames', '1'),
(187, 'forcelogin', '0'),
(188, 'forceloginforprofiles', '1'),
(189, 'forceloginforprofileimage', '0'),
(190, 'opentogoogle', '0'),
(191, 'maxbytes', '0'),
(192, 'userquota', '104857600'),
(193, 'allowobjectembed', '0'),
(194, 'enabletrusttext', '0'),
(195, 'maxeditingtime', '1800'),
(196, 'extendedusernamechars', '0'),
(197, 'sitepolicy', ''),
(198, 'sitepolicyguest', ''),
(199, 'keeptagnamecase', '1'),
(200, 'profilesforenrolledusersonly', '1'),
(201, 'cronclionly', '1'),
(202, 'cronremotepassword', ''),
(203, 'lockoutthreshold', '0'),
(204, 'lockoutwindow', '1800'),
(205, 'lockoutduration', '1800'),
(206, 'passwordpolicy', '1'),
(207, 'minpasswordlength', '8'),
(208, 'minpassworddigits', '1'),
(209, 'minpasswordlower', '1'),
(210, 'minpasswordupper', '1'),
(211, 'minpasswordnonalphanum', '1'),
(212, 'maxconsecutiveidentchars', '0'),
(213, 'passwordreuselimit', '0'),
(214, 'pwresettime', '1800'),
(215, 'passwordchangelogout', '0'),
(216, 'groupenrolmentkeypolicy', '1'),
(217, 'disableuserimages', '0'),
(218, 'emailchangeconfirmation', '1'),
(219, 'rememberusername', '2'),
(220, 'strictformsrequired', '0'),
(221, 'loginhttps', '0'),
(222, 'cookiesecure', '0'),
(223, 'cookiehttponly', '0'),
(224, 'allowframembedding', '0'),
(225, 'loginpasswordautocomplete', '0'),
(226, 'displayloginfailures', '0'),
(227, 'notifyloginfailures', ''),
(228, 'notifyloginthreshold', '10'),
(229, 'runclamonupload', '0'),
(230, 'pathtoclam', ''),
(231, 'quarantinedir', ''),
(232, 'clamfailureonupload', 'donothing'),
(233, 'themelist', ''),
(234, 'themedesignermode', '0'),
(235, 'allowuserthemes', '0'),
(236, 'allowcoursethemes', '0'),
(237, 'allowcategorythemes', '0'),
(238, 'allowthemechangeonurl', '0'),
(239, 'allowuserblockhiding', '1'),
(240, 'allowblockstodock', '1'),
(241, 'custommenuitems', 'Moodle community|https://moodle.org\r\n-Moodle free support|https://moodle.org/support\r\n-###\r\n-Moodle development|https://moodle.org/development\r\n--Moodle Docs|http://docs.moodle.org|Moodle Docs\r\n--German Moodle Docs|http://docs.moodle.org/de|Documentation in German|de\r\n#####\r\nMoodle.com|http://moodle.com/'),
(242, 'customusermenuitems', 'grades,grades|/grade/report/mygrades.php|grades\r\nmessages,message|/message/index.php|message\r\npreferences,moodle|/user/preferences.php|preferences'),
(243, 'enabledevicedetection', '1'),
(244, 'devicedetectregex', '[]'),
(245, 'calendartype', 'gregorian'),
(246, 'calendar_adminseesall', '0'),
(247, 'calendar_site_timeformat', '0'),
(248, 'calendar_startwday', '0'),
(249, 'calendar_weekend', '65'),
(250, 'calendar_lookahead', '21'),
(251, 'calendar_maxevents', '10'),
(252, 'enablecalendarexport', '1'),
(253, 'calendar_customexport', '1'),
(254, 'calendar_exportlookahead', '365'),
(255, 'calendar_exportlookback', '5'),
(256, 'calendar_exportsalt', 'efUpLBAnkSRm9NCfphcTv64KXFctNC4jaBvMifVNB9R5rZ6k1pJiN2gdvC3B'),
(257, 'calendar_showicalsource', '1'),
(258, 'useblogassociations', '1'),
(259, 'bloglevel', '4'),
(260, 'useexternalblogs', '1'),
(261, 'externalblogcrontime', '86400'),
(262, 'maxexternalblogsperuser', '1'),
(263, 'blogusecomments', '1'),
(264, 'blogshowcommentscount', '1'),
(265, 'defaulthomepage', '0'),
(266, 'allowguestmymoodle', '1'),
(267, 'navshowfullcoursenames', '0'),
(268, 'navshowcategories', '1'),
(269, 'navshowmycoursecategories', '0'),
(270, 'navshowallcourses', '0'),
(271, 'navexpandmycourses', '1'),
(272, 'navsortmycoursessort', 'sortorder'),
(273, 'navcourselimit', '20'),
(274, 'usesitenameforsitepages', '0'),
(275, 'linkadmincategories', '0'),
(276, 'linkcoursesections', '0'),
(277, 'navshowfrontpagemods', '1'),
(278, 'navadduserpostslinks', '1'),
(279, 'formatstringstriptags', '1'),
(280, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(281, 'core_media_enable_youtube', '1'),
(282, 'core_media_enable_vimeo', '0'),
(283, 'core_media_enable_mp3', '1'),
(284, 'core_media_enable_flv', '1'),
(285, 'core_media_enable_swf', '1'),
(286, 'core_media_enable_html5audio', '1'),
(287, 'core_media_enable_html5video', '1'),
(288, 'core_media_enable_qt', '1'),
(289, 'core_media_enable_wmp', '1'),
(290, 'core_media_enable_rm', '1'),
(291, 'docroot', 'http://docs.moodle.org'),
(292, 'doclang', ''),
(293, 'doctonewwindow', '0'),
(294, 'courselistshortnames', '0'),
(295, 'coursesperpage', '20'),
(296, 'courseswithsummarieslimit', '10'),
(297, 'courseoverviewfileslimit', '1'),
(298, 'courseoverviewfilesext', '.jpg,.gif,.png'),
(299, 'useexternalyui', '0'),
(300, 'yuicomboloading', '1'),
(301, 'cachejs', '1'),
(302, 'modchooserdefault', '1'),
(303, 'modeditingmenu', '1'),
(304, 'blockeditingmenu', '1'),
(305, 'additionalhtmlhead', ''),
(306, 'additionalhtmltopofbody', ''),
(307, 'additionalhtmlfooter', ''),
(308, 'pathtodu', ''),
(309, 'aspellpath', ''),
(310, 'pathtodot', ''),
(311, 'pathtogs', '/usr/bin/gs'),
(312, 'supportpage', ''),
(313, 'dbsessions', '0'),
(314, 'sessioncookie', ''),
(315, 'sessioncookiepath', ''),
(316, 'sessioncookiedomain', ''),
(317, 'statsfirstrun', 'none'),
(318, 'statsmaxruntime', '0'),
(319, 'statsruntimedays', '31'),
(320, 'statsruntimestarthour', '0'),
(321, 'statsruntimestartminute', '0'),
(322, 'statsuserthreshold', '0'),
(323, 'slasharguments', '1'),
(324, 'getremoteaddrconf', '0'),
(325, 'proxyhost', ''),
(326, 'proxyport', '0'),
(327, 'proxytype', 'HTTP'),
(328, 'proxyuser', ''),
(329, 'proxypassword', ''),
(330, 'proxybypass', 'localhost, 127.0.0.1'),
(331, 'maintenance_enabled', '0'),
(332, 'maintenance_message', ''),
(333, 'deleteunconfirmed', '168'),
(334, 'deleteincompleteusers', '0'),
(335, 'disablegradehistory', '0'),
(336, 'gradehistorylifetime', '0'),
(337, 'tempdatafoldercleanup', '168'),
(338, 'extramemorylimit', '512M'),
(339, 'maxtimelimit', '0'),
(340, 'curlcache', '120'),
(341, 'curltimeoutkbitrate', '56'),
(342, 'updateautocheck', '1'),
(343, 'updateautodeploy', '0'),
(344, 'updateminmaturity', '200'),
(345, 'updatenotifybuilds', '0'),
(346, 'enablesafebrowserintegration', '0'),
(347, 'dndallowtextandlinks', '0'),
(348, 'enablecssoptimiser', '0'),
(349, 'debug', '0'),
(350, 'debugdisplay', '1'),
(351, 'debugsmtp', '0'),
(352, 'perfdebug', '7'),
(353, 'debugstringids', '0'),
(354, 'debugvalidators', '0'),
(355, 'debugpageinfo', '0'),
(356, 'profilingenabled', '0'),
(357, 'profilingincluded', ''),
(358, 'profilingexcluded', ''),
(359, 'profilingautofrec', '0'),
(360, 'profilingallowme', '0'),
(361, 'profilingallowall', '0'),
(362, 'profilinglifetime', '1440'),
(363, 'profilingimportprefix', '(I)'),
(364, 'release', '2.9+ (Build: 20150618)'),
(365, 'branch', '29'),
(366, 'localcachedirpurged', '1436945646'),
(367, 'scheduledtaskreset', '1436945646'),
(368, 'allversionshash', 'fcd2ee2059c026beeaa66e7e922dbd37d507eb49'),
(370, 'notloggedinroleid', '6'),
(371, 'guestroleid', '6'),
(372, 'defaultuserroleid', '7'),
(373, 'creatornewroleid', '3'),
(374, 'restorernewroleid', '3'),
(375, 'gradebookroles', '5'),
(376, 'chat_method', 'ajax'),
(377, 'chat_refresh_userlist', '10'),
(378, 'chat_old_ping', '35'),
(379, 'chat_refresh_room', '5'),
(380, 'chat_normal_updatemode', 'jsupdate'),
(381, 'chat_serverhost', 'localhost'),
(382, 'chat_serverip', '127.0.0.1'),
(383, 'chat_serverport', '9111'),
(384, 'chat_servermax', '100'),
(385, 'data_enablerssfeeds', '0'),
(386, 'feedback_allowfullanonymous', '0'),
(387, 'forum_displaymode', '3'),
(388, 'forum_replytouser', '1'),
(389, 'forum_shortpost', '300'),
(390, 'forum_longpost', '600'),
(391, 'forum_manydiscussions', '100'),
(392, 'forum_maxbytes', '512000'),
(393, 'forum_maxattachments', '9'),
(394, 'forum_trackingtype', '1'),
(395, 'forum_trackreadposts', '1'),
(396, 'forum_allowforcedreadtracking', '0'),
(397, 'forum_oldpostdays', '14'),
(398, 'forum_usermarksread', '0'),
(399, 'forum_cleanreadtime', '2'),
(400, 'digestmailtime', '17'),
(401, 'forum_enablerssfeeds', '0'),
(402, 'forum_enabletimedposts', '0'),
(403, 'glossary_entbypage', '10'),
(404, 'glossary_dupentries', '0'),
(405, 'glossary_allowcomments', '0'),
(406, 'glossary_linkbydefault', '1'),
(407, 'glossary_defaultapproval', '1'),
(408, 'glossary_enablerssfeeds', '0'),
(409, 'glossary_linkentries', '0'),
(410, 'glossary_casesensitive', '0'),
(411, 'glossary_fullmatch', '0'),
(412, 'lesson_slideshowwidth', '640'),
(413, 'lesson_slideshowheight', '480'),
(414, 'lesson_slideshowbgcolor', '#FFFFFF'),
(415, 'lesson_mediawidth', '640'),
(416, 'lesson_mediaheight', '480'),
(417, 'lesson_mediaclose', '0'),
(418, 'lesson_maxhighscores', '10'),
(419, 'lesson_maxanswers', '4'),
(420, 'lesson_defaultnextpage', '0'),
(421, 'block_course_list_adminview', 'all'),
(422, 'block_course_list_hideallcourseslink', '0'),
(423, 'block_html_allowcssclasses', '0'),
(424, 'block_online_users_timetosee', '5'),
(425, 'block_rss_client_num_entries', '5'),
(426, 'block_rss_client_timeout', '30'),
(427, 'block_tags_showcoursetags', '0'),
(428, 'filter_censor_badwords', ''),
(429, 'filter_multilang_force_old', '0'),
(430, 'logguests', '1'),
(431, 'loglifetime', '0'),
(432, 'airnotifierurl', 'https://messages.moodle.net'),
(433, 'airnotifierport', '443'),
(434, 'airnotifiermobileappname', 'com.moodle.moodlemobile'),
(435, 'airnotifierappname', 'commoodlemoodlemobile'),
(436, 'airnotifieraccesskey', ''),
(437, 'smtphosts', ''),
(438, 'smtpsecure', ''),
(439, 'smtpuser', ''),
(440, 'smtppass', ''),
(441, 'smtpmaxbulk', '1'),
(442, 'noreplyaddress', 'noreply@localhost'),
(443, 'emailonlyfromnoreplyaddress', '0'),
(444, 'sitemailcharset', '0'),
(445, 'allowusermailcharset', '0'),
(446, 'allowattachments', '1'),
(447, 'mailnewline', 'LF'),
(448, 'jabberhost', ''),
(449, 'jabberserver', ''),
(450, 'jabberusername', ''),
(451, 'jabberpassword', ''),
(452, 'jabberport', '5222'),
(453, 'profileroles', '5,4,3'),
(454, 'coursecontact', '3'),
(455, 'frontpage', '6'),
(456, 'frontpageloggedin', '6'),
(457, 'maxcategorydepth', '2'),
(458, 'frontpagecourselimit', '200'),
(459, 'commentsperpage', '15'),
(460, 'defaultfrontpageroleid', '8'),
(461, 'supportname', 'Admin User'),
(462, 'supportemail', 'ptnhuan@gmail.com'),
(463, 'messageinbound_enabled', '0'),
(464, 'messageinbound_mailbox', ''),
(465, 'messageinbound_domain', ''),
(466, 'messageinbound_host', ''),
(467, 'messageinbound_hostssl', 'ssl'),
(468, 'messageinbound_hostuser', ''),
(469, 'messageinbound_hostpass', ''),
(470, 'timezone', 'Asia/Ho_Chi_Minh'),
(471, 'registerauth', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_log`
--

CREATE TABLE IF NOT EXISTS `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  `oldvalue` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Changes done in server configuration through admin UI' AUTO_INCREMENT=1075 ;

--
-- Dumping data for table `mdl_config_log`
--

INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1435054231, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1435054231, NULL, 'usecomments', '1', NULL),
(3, 0, 1435054231, NULL, 'usetags', '1', NULL),
(4, 0, 1435054231, NULL, 'enablenotes', '1', NULL),
(5, 0, 1435054231, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1435054232, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1435054232, NULL, 'messaging', '1', NULL),
(8, 0, 1435054232, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1435054232, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1435054232, NULL, 'messagingallowemailoverride', '0', NULL),
(11, 0, 1435054232, NULL, 'enablestats', '0', NULL),
(12, 0, 1435054232, NULL, 'enablerssfeeds', '0', NULL),
(13, 0, 1435054233, NULL, 'enableblogs', '1', NULL),
(14, 0, 1435054233, NULL, 'enablecompletion', '0', NULL),
(15, 0, 1435054233, NULL, 'completiondefault', '1', NULL),
(16, 0, 1435054233, NULL, 'enableavailability', '0', NULL),
(17, 0, 1435054233, NULL, 'enableplagiarism', '0', NULL),
(18, 0, 1435054233, NULL, 'enablebadges', '1', NULL),
(19, 0, 1435054233, NULL, 'defaultpreference_maildisplay', '2', NULL),
(20, 0, 1435054233, NULL, 'defaultpreference_mailformat', '1', NULL),
(21, 0, 1435054234, NULL, 'defaultpreference_maildigest', '0', NULL),
(22, 0, 1435054234, NULL, 'defaultpreference_autosubscribe', '1', NULL),
(23, 0, 1435054234, NULL, 'defaultpreference_trackforums', '0', NULL),
(24, 0, 1435054234, NULL, 'autologinguests', '0', NULL),
(25, 0, 1435054234, NULL, 'hiddenuserfields', '', NULL),
(26, 0, 1435054234, NULL, 'showuseridentity', 'email', NULL),
(27, 0, 1435054235, NULL, 'fullnamedisplay', 'language', NULL),
(28, 0, 1435054236, NULL, 'alternativefullnameformat', 'language', NULL),
(29, 0, 1435054236, NULL, 'maxusersperpage', '100', NULL),
(30, 0, 1435054236, NULL, 'enablegravatar', '0', NULL),
(31, 0, 1435054237, NULL, 'gravatardefaulturl', 'mm', NULL),
(32, 0, 1435054237, 'moodlecourse', 'visible', '1', NULL),
(33, 0, 1435054237, 'moodlecourse', 'format', 'weeks', NULL),
(34, 0, 1435054237, 'moodlecourse', 'maxsections', '52', NULL),
(35, 0, 1435054237, 'moodlecourse', 'numsections', '10', NULL),
(36, 0, 1435054237, 'moodlecourse', 'hiddensections', '0', NULL),
(37, 0, 1435054237, 'moodlecourse', 'coursedisplay', '0', NULL),
(38, 0, 1435054237, 'moodlecourse', 'lang', '', NULL),
(39, 0, 1435054238, 'moodlecourse', 'newsitems', '5', NULL),
(40, 0, 1435054238, 'moodlecourse', 'showgrades', '1', NULL),
(41, 0, 1435054238, 'moodlecourse', 'showreports', '0', NULL),
(42, 0, 1435054238, 'moodlecourse', 'maxbytes', '0', NULL),
(43, 0, 1435054238, 'moodlecourse', 'enablecompletion', '0', NULL),
(44, 0, 1435054238, 'moodlecourse', 'groupmode', '0', NULL),
(45, 0, 1435054238, 'moodlecourse', 'groupmodeforce', '0', NULL),
(46, 0, 1435054238, NULL, 'enablecourserequests', '0', NULL),
(47, 0, 1435054238, NULL, 'defaultrequestcategory', '1', NULL),
(48, 0, 1435054239, NULL, 'requestcategoryselection', '0', NULL),
(49, 0, 1435054239, NULL, 'courserequestnotify', '', NULL),
(50, 0, 1435054239, 'backup', 'loglifetime', '30', NULL),
(51, 0, 1435054239, 'backup', 'backup_general_users', '1', NULL),
(52, 0, 1435054239, 'backup', 'backup_general_users_locked', '', NULL),
(53, 0, 1435054239, 'backup', 'backup_general_anonymize', '0', NULL),
(54, 0, 1435054239, 'backup', 'backup_general_anonymize_locked', '', NULL),
(55, 0, 1435054239, 'backup', 'backup_general_role_assignments', '1', NULL),
(56, 0, 1435054240, 'backup', 'backup_general_role_assignments_locked', '', NULL),
(57, 0, 1435054240, 'backup', 'backup_general_activities', '1', NULL),
(58, 0, 1435054240, 'backup', 'backup_general_activities_locked', '', NULL),
(59, 0, 1435054240, 'backup', 'backup_general_blocks', '1', NULL),
(60, 0, 1435054240, 'backup', 'backup_general_blocks_locked', '', NULL),
(61, 0, 1435054240, 'backup', 'backup_general_filters', '1', NULL),
(62, 0, 1435054240, 'backup', 'backup_general_filters_locked', '', NULL),
(63, 0, 1435054241, 'backup', 'backup_general_comments', '1', NULL),
(64, 0, 1435054241, 'backup', 'backup_general_comments_locked', '', NULL),
(65, 0, 1435054241, 'backup', 'backup_general_badges', '1', NULL),
(66, 0, 1435054241, 'backup', 'backup_general_badges_locked', '', NULL),
(67, 0, 1435054241, 'backup', 'backup_general_userscompletion', '1', NULL),
(68, 0, 1435054241, 'backup', 'backup_general_userscompletion_locked', '', NULL),
(69, 0, 1435054241, 'backup', 'backup_general_logs', '0', NULL),
(70, 0, 1435054241, 'backup', 'backup_general_logs_locked', '', NULL),
(71, 0, 1435054241, 'backup', 'backup_general_histories', '0', NULL),
(72, 0, 1435054241, 'backup', 'backup_general_histories_locked', '', NULL),
(73, 0, 1435054242, 'backup', 'backup_general_questionbank', '1', NULL),
(74, 0, 1435054242, 'backup', 'backup_general_questionbank_locked', '', NULL),
(75, 0, 1435054242, 'backup', 'backup_general_groups', '1', NULL),
(76, 0, 1435054242, 'backup', 'backup_general_groups_locked', '', NULL),
(77, 0, 1435054242, 'backup', 'import_general_maxresults', '10', NULL),
(78, 0, 1435054242, 'backup', 'backup_auto_active', '0', NULL),
(79, 0, 1435054242, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(80, 0, 1435054242, 'backup', 'backup_auto_hour', '0', NULL),
(81, 0, 1435054243, 'backup', 'backup_auto_minute', '0', NULL),
(82, 0, 1435054243, 'backup', 'backup_auto_storage', '0', NULL),
(83, 0, 1435054243, 'backup', 'backup_auto_destination', '', NULL),
(84, 0, 1435054243, 'backup', 'backup_auto_keep', '1', NULL),
(85, 0, 1435054243, 'backup', 'backup_shortname', '0', NULL),
(86, 0, 1435054243, 'backup', 'backup_auto_skip_hidden', '1', NULL),
(87, 0, 1435054243, 'backup', 'backup_auto_skip_modif_days', '30', NULL),
(88, 0, 1435054243, 'backup', 'backup_auto_skip_modif_prev', '0', NULL),
(89, 0, 1435054243, 'backup', 'backup_auto_users', '1', NULL),
(90, 0, 1435054244, 'backup', 'backup_auto_role_assignments', '1', NULL),
(91, 0, 1435054244, 'backup', 'backup_auto_activities', '1', NULL),
(92, 0, 1435054244, 'backup', 'backup_auto_blocks', '1', NULL),
(93, 0, 1435054244, 'backup', 'backup_auto_filters', '1', NULL),
(94, 0, 1435054244, 'backup', 'backup_auto_comments', '1', NULL),
(95, 0, 1435054244, 'backup', 'backup_auto_badges', '1', NULL),
(96, 0, 1435054244, 'backup', 'backup_auto_userscompletion', '1', NULL),
(97, 0, 1435054245, 'backup', 'backup_auto_logs', '0', NULL),
(98, 0, 1435054245, 'backup', 'backup_auto_histories', '0', NULL),
(99, 0, 1435054245, 'backup', 'backup_auto_questionbank', '1', NULL),
(100, 0, 1435054245, 'backup', 'backup_auto_groups', '1', NULL),
(101, 0, 1435054245, NULL, 'grade_profilereport', 'user', NULL),
(102, 0, 1435054245, NULL, 'grade_aggregationposition', '1', NULL),
(103, 0, 1435054245, NULL, 'grade_includescalesinaggregation', '1', NULL),
(104, 0, 1435054246, NULL, 'grade_hiddenasdate', '0', NULL),
(105, 0, 1435054246, NULL, 'gradepublishing', '0', NULL),
(106, 0, 1435054246, NULL, 'grade_export_displaytype', '1', NULL),
(107, 0, 1435054246, NULL, 'grade_export_decimalpoints', '2', NULL),
(108, 0, 1435054246, NULL, 'grade_navmethod', '0', NULL),
(109, 0, 1435054246, NULL, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email', NULL),
(110, 0, 1435054246, NULL, 'grade_export_customprofilefields', '', NULL),
(111, 0, 1435054246, NULL, 'recovergradesdefault', '0', NULL),
(112, 0, 1435054247, NULL, 'gradeexport', '', NULL),
(113, 0, 1435054247, NULL, 'unlimitedgrades', '0', NULL),
(114, 0, 1435054247, NULL, 'grade_report_showmin', '1', NULL),
(115, 0, 1435054247, NULL, 'gradepointmax', '100', NULL),
(116, 0, 1435054247, NULL, 'gradepointdefault', '100', NULL),
(117, 0, 1435054247, NULL, 'grade_minmaxtouse', '1', NULL),
(118, 0, 1435054248, NULL, 'grade_mygrades_report', 'overview', NULL),
(119, 0, 1435054248, NULL, 'gradereport_mygradeurl', '', NULL),
(120, 0, 1435054248, NULL, 'grade_hideforcedsettings', '1', NULL),
(121, 0, 1435054248, NULL, 'grade_aggregation', '13', NULL),
(122, 0, 1435054248, NULL, 'grade_aggregation_flag', '0', NULL),
(123, 0, 1435054248, NULL, 'grade_aggregations_visible', '13', NULL),
(124, 0, 1435054248, NULL, 'grade_aggregateonlygraded', '1', NULL),
(125, 0, 1435054248, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(126, 0, 1435054249, NULL, 'grade_aggregateoutcomes', '0', NULL),
(127, 0, 1435054249, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(128, 0, 1435054249, NULL, 'grade_keephigh', '0', NULL),
(129, 0, 1435054249, NULL, 'grade_keephigh_flag', '3', NULL),
(130, 0, 1435054249, NULL, 'grade_droplow', '0', NULL),
(131, 0, 1435054249, NULL, 'grade_droplow_flag', '2', NULL),
(132, 0, 1435054249, NULL, 'grade_overridecat', '1', NULL),
(133, 0, 1435054250, NULL, 'grade_displaytype', '1', NULL),
(134, 0, 1435054250, NULL, 'grade_decimalpoints', '2', NULL),
(135, 0, 1435054250, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(136, 0, 1435054250, NULL, 'grade_report_studentsperpage', '100', NULL),
(137, 0, 1435054250, NULL, 'grade_report_showonlyactiveenrol', '1', NULL),
(138, 0, 1435054250, NULL, 'grade_report_quickgrading', '1', NULL),
(139, 0, 1435054250, NULL, 'grade_report_showquickfeedback', '0', NULL),
(140, 0, 1435054251, NULL, 'grade_report_meanselection', '1', NULL),
(141, 0, 1435054251, NULL, 'grade_report_enableajax', '0', NULL),
(142, 0, 1435054251, NULL, 'grade_report_showcalculations', '1', NULL),
(143, 0, 1435054251, NULL, 'grade_report_showeyecons', '0', NULL),
(144, 0, 1435054251, NULL, 'grade_report_showaverages', '1', NULL),
(145, 0, 1435054251, NULL, 'grade_report_showlocks', '0', NULL),
(146, 0, 1435054251, NULL, 'grade_report_showranges', '0', NULL),
(147, 0, 1435054251, NULL, 'grade_report_showanalysisicon', '1', NULL),
(148, 0, 1435054252, NULL, 'grade_report_showuserimage', '1', NULL),
(149, 0, 1435054252, NULL, 'grade_report_showactivityicons', '1', NULL),
(150, 0, 1435054252, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(151, 0, 1435054252, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(152, 0, 1435054252, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(153, 0, 1435054252, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(154, 0, 1435054253, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(155, 0, 1435054253, NULL, 'grade_report_historyperpage', '50', NULL),
(156, 0, 1435054253, NULL, 'grade_report_overview_showrank', '0', NULL),
(157, 0, 1435054253, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(158, 0, 1435054254, NULL, 'grade_report_user_showrank', '0', NULL),
(159, 0, 1435054256, NULL, 'grade_report_user_showpercentage', '1', NULL),
(160, 0, 1435054256, NULL, 'grade_report_user_showgrade', '1', NULL),
(161, 0, 1435054256, NULL, 'grade_report_user_showfeedback', '1', NULL),
(162, 0, 1435054256, NULL, 'grade_report_user_showrange', '1', NULL),
(163, 0, 1435054257, NULL, 'grade_report_user_showweight', '1', NULL),
(164, 0, 1435054257, NULL, 'grade_report_user_showaverage', '0', NULL),
(165, 0, 1435054257, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(166, 0, 1435054257, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(167, 0, 1435054257, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(168, 0, 1435054257, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(169, 0, 1435054258, NULL, 'grade_report_user_showcontributiontocoursetotal', '1', NULL),
(170, 0, 1435054258, NULL, 'badges_defaultissuername', '', NULL),
(171, 0, 1435054258, NULL, 'badges_defaultissuercontact', '', NULL),
(172, 0, 1435054258, NULL, 'badges_badgesalt', 'badges1435054157', NULL),
(173, 0, 1435054258, NULL, 'badges_allowexternalbackpack', '1', NULL),
(174, 0, 1435054258, NULL, 'badges_allowcoursebadges', '1', NULL),
(175, 0, 1435054261, NULL, 'timezone', 'Europe/Paris', NULL),
(176, 0, 1435054265, NULL, 'forcetimezone', '99', NULL),
(177, 0, 1435054265, NULL, 'country', '0', NULL),
(178, 0, 1435054265, NULL, 'defaultcity', '', NULL),
(179, 0, 1435054265, NULL, 'geoipfile', 'F:\\wamp\\moodledata/geoip/GeoLiteCity.dat', NULL),
(180, 0, 1435054266, NULL, 'googlemapkey3', '', NULL),
(181, 0, 1435054266, NULL, 'allcountrycodes', '', NULL),
(182, 0, 1435054266, NULL, 'autolang', '1', NULL),
(183, 0, 1435054266, NULL, 'lang', 'en', NULL),
(184, 0, 1435054266, NULL, 'langmenu', '1', NULL),
(185, 0, 1435054266, NULL, 'langlist', '', NULL),
(186, 0, 1435054267, NULL, 'langcache', '1', NULL),
(187, 0, 1435054267, NULL, 'langstringcache', '1', NULL),
(188, 0, 1435054267, NULL, 'locale', '', NULL),
(189, 0, 1435054268, NULL, 'latinexcelexport', '0', NULL),
(190, 0, 1435054268, NULL, 'requiremodintro', '0', NULL),
(191, 0, 1435054269, NULL, 'registerauth', '', NULL),
(192, 0, 1435054269, NULL, 'authloginviaemail', '0', NULL),
(193, 0, 1435054269, NULL, 'authpreventaccountcreation', '0', NULL),
(194, 0, 1435054269, NULL, 'loginpageautofocus', '0', NULL),
(195, 0, 1435054269, NULL, 'guestloginbutton', '1', NULL),
(196, 0, 1435054269, NULL, 'limitconcurrentlogins', '0', NULL),
(197, 0, 1435054270, NULL, 'alternateloginurl', '', NULL),
(198, 0, 1435054270, NULL, 'forgottenpasswordurl', '', NULL),
(199, 0, 1435054270, NULL, 'auth_instructions', '', NULL),
(200, 0, 1435054270, NULL, 'allowemailaddresses', '', NULL),
(201, 0, 1435054270, NULL, 'denyemailaddresses', '', NULL),
(202, 0, 1435054270, NULL, 'verifychangedemail', '1', NULL),
(203, 0, 1435054270, NULL, 'recaptchapublickey', '', NULL),
(204, 0, 1435054271, NULL, 'recaptchaprivatekey', '', NULL),
(205, 0, 1435054271, 'cachestore_memcache', 'testservers', '', NULL),
(206, 0, 1435054271, 'cachestore_memcached', 'testservers', '', NULL),
(207, 0, 1435054271, 'cachestore_mongodb', 'testserver', '', NULL),
(208, 0, 1435054271, NULL, 'filteruploadedfiles', '0', NULL),
(209, 0, 1435054271, NULL, 'filtermatchoneperpage', '0', NULL),
(210, 0, 1435054271, NULL, 'filtermatchonepertext', '0', NULL),
(211, 0, 1435054271, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(212, 0, 1435054272, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(213, 0, 1435054272, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(214, 0, 1435054272, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(215, 0, 1435054272, NULL, 'portfolio_high_db_threshold', '50', NULL),
(216, 0, 1435054273, 'question_preview', 'behaviour', 'deferredfeedback', NULL),
(217, 0, 1435054273, 'question_preview', 'correctness', '1', NULL),
(218, 0, 1435054273, 'question_preview', 'marks', '2', NULL),
(219, 0, 1435054273, 'question_preview', 'markdp', '2', NULL),
(220, 0, 1435054273, 'question_preview', 'feedback', '1', NULL),
(221, 0, 1435054273, 'question_preview', 'generalfeedback', '1', NULL),
(222, 0, 1435054274, 'question_preview', 'rightanswer', '1', NULL),
(223, 0, 1435054274, 'question_preview', 'history', '0', NULL),
(224, 0, 1435054274, NULL, 'repositorycacheexpire', '120', NULL),
(225, 0, 1435054274, NULL, 'repositorygetfiletimeout', '30', NULL),
(226, 0, 1435054274, NULL, 'repositorysyncfiletimeout', '1', NULL),
(227, 0, 1435054274, NULL, 'repositorysyncimagetimeout', '3', NULL),
(228, 0, 1435054274, NULL, 'repositoryallowexternallinks', '1', NULL),
(229, 0, 1435054275, NULL, 'legacyfilesinnewcourses', '0', NULL),
(230, 0, 1435054275, NULL, 'legacyfilesaddallowed', '1', NULL),
(231, 0, 1435054275, NULL, 'mobilecssurl', '', NULL),
(232, 0, 1435054275, NULL, 'enablewsdocumentation', '0', NULL),
(233, 0, 1435054275, NULL, 'allowbeforeblock', '0', NULL),
(234, 0, 1435054275, NULL, 'allowedip', '', NULL),
(235, 0, 1435054276, NULL, 'blockedip', '', NULL),
(236, 0, 1435054276, NULL, 'protectusernames', '1', NULL),
(237, 0, 1435054276, NULL, 'forcelogin', '0', NULL),
(238, 0, 1435054276, NULL, 'forceloginforprofiles', '1', NULL),
(239, 0, 1435054276, NULL, 'forceloginforprofileimage', '0', NULL),
(240, 0, 1435054276, NULL, 'opentogoogle', '0', NULL),
(241, 0, 1435054277, NULL, 'maxbytes', '0', NULL),
(242, 0, 1435054278, NULL, 'userquota', '104857600', NULL),
(243, 0, 1435054278, NULL, 'allowobjectembed', '0', NULL),
(244, 0, 1435054278, NULL, 'enabletrusttext', '0', NULL),
(245, 0, 1435054279, NULL, 'maxeditingtime', '1800', NULL),
(246, 0, 1435054279, NULL, 'extendedusernamechars', '0', NULL),
(247, 0, 1435054279, NULL, 'sitepolicy', '', NULL),
(248, 0, 1435054279, NULL, 'sitepolicyguest', '', NULL),
(249, 0, 1435054279, NULL, 'keeptagnamecase', '1', NULL),
(250, 0, 1435054280, NULL, 'profilesforenrolledusersonly', '1', NULL),
(251, 0, 1435054280, NULL, 'cronclionly', '1', NULL),
(252, 0, 1435054280, NULL, 'cronremotepassword', '', NULL),
(253, 0, 1435054280, NULL, 'lockoutthreshold', '0', NULL),
(254, 0, 1435054280, NULL, 'lockoutwindow', '1800', NULL),
(255, 0, 1435054280, NULL, 'lockoutduration', '1800', NULL),
(256, 0, 1435054280, NULL, 'passwordpolicy', '1', NULL),
(257, 0, 1435054281, NULL, 'minpasswordlength', '8', NULL),
(258, 0, 1435054281, NULL, 'minpassworddigits', '1', NULL),
(259, 0, 1435054281, NULL, 'minpasswordlower', '1', NULL),
(260, 0, 1435054281, NULL, 'minpasswordupper', '1', NULL),
(261, 0, 1435054281, NULL, 'minpasswordnonalphanum', '1', NULL),
(262, 0, 1435054281, NULL, 'maxconsecutiveidentchars', '0', NULL),
(263, 0, 1435054281, NULL, 'passwordreuselimit', '0', NULL),
(264, 0, 1435054281, NULL, 'pwresettime', '1800', NULL),
(265, 0, 1435054282, NULL, 'passwordchangelogout', '0', NULL),
(266, 0, 1435054282, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(267, 0, 1435054282, NULL, 'disableuserimages', '0', NULL),
(268, 0, 1435054282, NULL, 'emailchangeconfirmation', '1', NULL),
(269, 0, 1435054282, NULL, 'rememberusername', '2', NULL),
(270, 0, 1435054282, NULL, 'strictformsrequired', '0', NULL),
(271, 0, 1435054283, NULL, 'loginhttps', '0', NULL),
(272, 0, 1435054283, NULL, 'cookiesecure', '0', NULL),
(273, 0, 1435054283, NULL, 'cookiehttponly', '0', NULL),
(274, 0, 1435054283, NULL, 'allowframembedding', '0', NULL),
(275, 0, 1435054283, NULL, 'loginpasswordautocomplete', '0', NULL),
(276, 0, 1435054283, NULL, 'displayloginfailures', '0', NULL),
(277, 0, 1435054284, NULL, 'notifyloginfailures', '', NULL),
(278, 0, 1435054284, NULL, 'notifyloginthreshold', '10', NULL),
(279, 0, 1435054284, NULL, 'runclamonupload', '0', NULL),
(280, 0, 1435054284, NULL, 'pathtoclam', '', NULL),
(281, 0, 1435054284, NULL, 'quarantinedir', '', NULL),
(282, 0, 1435054284, NULL, 'clamfailureonupload', 'donothing', NULL),
(283, 0, 1435054284, NULL, 'themelist', '', NULL),
(284, 0, 1435054285, NULL, 'themedesignermode', '0', NULL),
(285, 0, 1435054285, NULL, 'allowuserthemes', '0', NULL),
(286, 0, 1435054285, NULL, 'allowcoursethemes', '0', NULL),
(287, 0, 1435054285, NULL, 'allowcategorythemes', '0', NULL),
(288, 0, 1435054285, NULL, 'allowthemechangeonurl', '0', NULL),
(289, 0, 1435054285, NULL, 'allowuserblockhiding', '1', NULL),
(290, 0, 1435054285, NULL, 'allowblockstodock', '1', NULL),
(291, 0, 1435054286, NULL, 'custommenuitems', '', NULL),
(292, 0, 1435054286, NULL, 'customusermenuitems', 'grades,grades|/grade/report/mygrades.php|grades\nmessages,message|/message/index.php|message\npreferences,moodle|/user/preferences.php|preferences', NULL),
(293, 0, 1435054286, NULL, 'enabledevicedetection', '1', NULL),
(294, 0, 1435054286, NULL, 'devicedetectregex', '[]', NULL),
(295, 0, 1435054286, 'theme_clean', 'invert', '0', NULL),
(296, 0, 1435054286, 'theme_clean', 'logo', '', NULL),
(297, 0, 1435054286, 'theme_clean', 'customcss', '', NULL),
(298, 0, 1435054287, 'theme_clean', 'footnote', '', NULL),
(299, 0, 1435054287, 'theme_more', 'textcolor', '#333366', NULL),
(300, 0, 1435054287, 'theme_more', 'linkcolor', '#FF6500', NULL),
(301, 0, 1435054287, 'theme_more', 'bodybackground', '', NULL),
(302, 0, 1435054287, 'theme_more', 'backgroundimage', '', NULL),
(303, 0, 1435054287, 'theme_more', 'backgroundrepeat', 'repeat', NULL),
(304, 0, 1435054287, 'theme_more', 'backgroundposition', '0', NULL),
(305, 0, 1435054287, 'theme_more', 'backgroundfixed', '0', NULL),
(306, 0, 1435054287, 'theme_more', 'contentbackground', '#FFFFFF', NULL),
(307, 0, 1435054288, 'theme_more', 'secondarybackground', '#FFFFFF', NULL),
(308, 0, 1435054288, 'theme_more', 'invert', '1', NULL),
(309, 0, 1435054288, 'theme_more', 'logo', '', NULL),
(310, 0, 1435054288, 'theme_more', 'customcss', '', NULL),
(311, 0, 1435054288, 'theme_more', 'footnote', '', NULL),
(312, 0, 1435054288, NULL, 'calendartype', 'gregorian', NULL),
(313, 0, 1435054289, NULL, 'calendar_adminseesall', '0', NULL),
(314, 0, 1435054289, NULL, 'calendar_site_timeformat', '0', NULL),
(315, 0, 1435054289, NULL, 'calendar_startwday', '0', NULL),
(316, 0, 1435054289, NULL, 'calendar_weekend', '65', NULL),
(317, 0, 1435054289, NULL, 'calendar_lookahead', '21', NULL),
(318, 0, 1435054289, NULL, 'calendar_maxevents', '10', NULL),
(319, 0, 1435054289, NULL, 'enablecalendarexport', '1', NULL),
(320, 0, 1435054290, NULL, 'calendar_customexport', '1', NULL),
(321, 0, 1435054290, NULL, 'calendar_exportlookahead', '365', NULL),
(322, 0, 1435054290, NULL, 'calendar_exportlookback', '5', NULL),
(323, 0, 1435054290, NULL, 'calendar_exportsalt', 'efUpLBAnkSRm9NCfphcTv64KXFctNC4jaBvMifVNB9R5rZ6k1pJiN2gdvC3B', NULL),
(324, 0, 1435054290, NULL, 'calendar_showicalsource', '1', NULL),
(325, 0, 1435054290, NULL, 'useblogassociations', '1', NULL),
(326, 0, 1435054291, NULL, 'bloglevel', '4', NULL),
(327, 0, 1435054291, NULL, 'useexternalblogs', '1', NULL),
(328, 0, 1435054291, NULL, 'externalblogcrontime', '86400', NULL),
(329, 0, 1435054291, NULL, 'maxexternalblogsperuser', '1', NULL),
(330, 0, 1435054291, NULL, 'blogusecomments', '1', NULL),
(331, 0, 1435054291, NULL, 'blogshowcommentscount', '1', NULL),
(332, 0, 1435054291, NULL, 'defaulthomepage', '1', NULL),
(333, 0, 1435054292, NULL, 'allowguestmymoodle', '1', NULL),
(334, 0, 1435054292, NULL, 'navshowfullcoursenames', '0', NULL),
(335, 0, 1435054292, NULL, 'navshowcategories', '1', NULL),
(336, 0, 1435054292, NULL, 'navshowmycoursecategories', '0', NULL),
(337, 0, 1435054292, NULL, 'navshowallcourses', '0', NULL),
(338, 0, 1435054292, NULL, 'navexpandmycourses', '1', NULL),
(339, 0, 1435054292, NULL, 'navsortmycoursessort', 'sortorder', NULL),
(340, 0, 1435054292, NULL, 'navcourselimit', '20', NULL),
(341, 0, 1435054293, NULL, 'usesitenameforsitepages', '0', NULL),
(342, 0, 1435054293, NULL, 'linkadmincategories', '0', NULL),
(343, 0, 1435054293, NULL, 'linkcoursesections', '0', NULL),
(344, 0, 1435054293, NULL, 'navshowfrontpagemods', '1', NULL),
(345, 0, 1435054293, NULL, 'navadduserpostslinks', '1', NULL),
(346, 0, 1435054293, NULL, 'formatstringstriptags', '1', NULL),
(347, 0, 1435054293, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(348, 0, 1435054294, NULL, 'core_media_enable_youtube', '1', NULL),
(349, 0, 1435054294, NULL, 'core_media_enable_vimeo', '0', NULL),
(350, 0, 1435054294, NULL, 'core_media_enable_mp3', '1', NULL),
(351, 0, 1435054294, NULL, 'core_media_enable_flv', '1', NULL),
(352, 0, 1435054294, NULL, 'core_media_enable_swf', '1', NULL),
(353, 0, 1435054294, NULL, 'core_media_enable_html5audio', '1', NULL),
(354, 0, 1435054294, NULL, 'core_media_enable_html5video', '1', NULL),
(355, 0, 1435054295, NULL, 'core_media_enable_qt', '1', NULL),
(356, 0, 1435054295, NULL, 'core_media_enable_wmp', '1', NULL),
(357, 0, 1435054295, NULL, 'core_media_enable_rm', '1', NULL),
(358, 0, 1435054295, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(359, 0, 1435054295, NULL, 'doclang', '', NULL),
(360, 0, 1435054296, NULL, 'doctonewwindow', '0', NULL),
(361, 0, 1435054296, NULL, 'courselistshortnames', '0', NULL),
(362, 0, 1435054296, NULL, 'coursesperpage', '20', NULL),
(363, 0, 1435054296, NULL, 'courseswithsummarieslimit', '10', NULL),
(364, 0, 1435054296, NULL, 'courseoverviewfileslimit', '1', NULL),
(365, 0, 1435054296, NULL, 'courseoverviewfilesext', '.jpg,.gif,.png', NULL),
(366, 0, 1435054297, NULL, 'useexternalyui', '0', NULL),
(367, 0, 1435054297, NULL, 'yuicomboloading', '1', NULL),
(368, 0, 1435054297, NULL, 'cachejs', '1', NULL),
(369, 0, 1435054297, NULL, 'modchooserdefault', '1', NULL),
(370, 0, 1435054297, NULL, 'modeditingmenu', '1', NULL),
(371, 0, 1435054297, NULL, 'blockeditingmenu', '1', NULL),
(372, 0, 1435054297, NULL, 'additionalhtmlhead', '', NULL),
(373, 0, 1435054297, NULL, 'additionalhtmltopofbody', '', NULL),
(374, 0, 1435054298, NULL, 'additionalhtmlfooter', '', NULL),
(375, 0, 1435054298, NULL, 'pathtodu', '', NULL),
(376, 0, 1435054298, NULL, 'aspellpath', '', NULL),
(377, 0, 1435054298, NULL, 'pathtodot', '', NULL),
(378, 0, 1435054298, NULL, 'pathtogs', '/usr/bin/gs', NULL),
(379, 0, 1435054299, NULL, 'supportpage', '', NULL),
(380, 0, 1435054299, NULL, 'dbsessions', '0', NULL),
(381, 0, 1435054299, NULL, 'sessioncookie', '', NULL),
(382, 0, 1435054299, NULL, 'sessioncookiepath', '', NULL),
(383, 0, 1435054299, NULL, 'sessioncookiedomain', '', NULL),
(384, 0, 1435054299, NULL, 'statsfirstrun', 'none', NULL),
(385, 0, 1435054299, NULL, 'statsmaxruntime', '0', NULL),
(386, 0, 1435054300, NULL, 'statsruntimedays', '31', NULL),
(387, 0, 1435054300, NULL, 'statsruntimestarthour', '0', NULL),
(388, 0, 1435054300, NULL, 'statsruntimestartminute', '0', NULL),
(389, 0, 1435054300, NULL, 'statsuserthreshold', '0', NULL),
(390, 0, 1435054300, NULL, 'slasharguments', '1', NULL),
(391, 0, 1435054300, NULL, 'getremoteaddrconf', '0', NULL),
(392, 0, 1435054301, NULL, 'proxyhost', '', NULL),
(393, 0, 1435054301, NULL, 'proxyport', '0', NULL),
(394, 0, 1435054301, NULL, 'proxytype', 'HTTP', NULL),
(395, 0, 1435054301, NULL, 'proxyuser', '', NULL),
(396, 0, 1435054301, NULL, 'proxypassword', '', NULL),
(397, 0, 1435054301, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(398, 0, 1435054302, NULL, 'maintenance_enabled', '0', NULL),
(399, 0, 1435054302, NULL, 'maintenance_message', '', NULL),
(400, 0, 1435054302, NULL, 'deleteunconfirmed', '168', NULL),
(401, 0, 1435054302, NULL, 'deleteincompleteusers', '0', NULL),
(402, 0, 1435054302, NULL, 'disablegradehistory', '0', NULL),
(403, 0, 1435054302, NULL, 'gradehistorylifetime', '0', NULL),
(404, 0, 1435054302, NULL, 'tempdatafoldercleanup', '168', NULL),
(405, 0, 1435054303, NULL, 'extramemorylimit', '512M', NULL),
(406, 0, 1435054303, NULL, 'maxtimelimit', '0', NULL),
(407, 0, 1435054303, NULL, 'curlcache', '120', NULL),
(408, 0, 1435054303, NULL, 'curltimeoutkbitrate', '56', NULL),
(409, 0, 1435054303, NULL, 'updateautocheck', '1', NULL),
(410, 0, 1435054303, NULL, 'updateautodeploy', '0', NULL),
(411, 0, 1435054303, NULL, 'updateminmaturity', '200', NULL),
(412, 0, 1435054304, NULL, 'updatenotifybuilds', '0', NULL),
(413, 0, 1435054304, NULL, 'enablesafebrowserintegration', '0', NULL),
(414, 0, 1435054304, NULL, 'dndallowtextandlinks', '0', NULL),
(415, 0, 1435054304, NULL, 'enablecssoptimiser', '0', NULL),
(416, 0, 1435054304, NULL, 'debug', '0', NULL),
(417, 0, 1435054304, NULL, 'debugdisplay', '1', NULL),
(418, 0, 1435054305, NULL, 'debugsmtp', '0', NULL),
(419, 0, 1435054305, NULL, 'perfdebug', '7', NULL),
(420, 0, 1435054305, NULL, 'debugstringids', '0', NULL),
(421, 0, 1435054305, NULL, 'debugvalidators', '0', NULL),
(422, 0, 1435054305, NULL, 'debugpageinfo', '0', NULL),
(423, 0, 1435054305, NULL, 'profilingenabled', '0', NULL),
(424, 0, 1435054306, NULL, 'profilingincluded', '', NULL),
(425, 0, 1435054306, NULL, 'profilingexcluded', '', NULL),
(426, 0, 1435054306, NULL, 'profilingautofrec', '0', NULL),
(427, 0, 1435054306, NULL, 'profilingallowme', '0', NULL),
(428, 0, 1435054306, NULL, 'profilingallowall', '0', NULL),
(429, 0, 1435054306, NULL, 'profilinglifetime', '1440', NULL),
(430, 0, 1435054307, NULL, 'profilingimportprefix', '(I)', NULL),
(431, 0, 1435054566, 'activitynames', 'filter_active', '1', ''),
(432, 0, 1435054570, 'mathjaxloader', 'filter_active', '1', ''),
(433, 0, 1435054571, 'mediaplugin', 'filter_active', '1', ''),
(434, 2, 1435055111, NULL, 'notloggedinroleid', '6', NULL),
(435, 2, 1435055111, NULL, 'guestroleid', '6', NULL),
(436, 2, 1435055111, NULL, 'defaultuserroleid', '7', NULL),
(437, 2, 1435055111, NULL, 'creatornewroleid', '3', NULL),
(438, 2, 1435055111, NULL, 'restorernewroleid', '3', NULL),
(439, 2, 1435055112, NULL, 'gradebookroles', '5', NULL),
(440, 2, 1435055112, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments', NULL),
(441, 2, 1435055112, 'assign', 'showrecentsubmissions', '0', NULL),
(442, 2, 1435055112, 'assign', 'submissionreceipts', '1', NULL),
(443, 2, 1435055112, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.', NULL),
(444, 2, 1435055112, 'assign', 'alwaysshowdescription', '1', NULL),
(445, 2, 1435055112, 'assign', 'alwaysshowdescription_adv', '', NULL),
(446, 2, 1435055112, 'assign', 'alwaysshowdescription_locked', '', NULL),
(447, 2, 1435055113, 'assign', 'allowsubmissionsfromdate', '0', NULL),
(448, 2, 1435055113, 'assign', 'allowsubmissionsfromdate_enabled', '1', NULL),
(449, 2, 1435055113, 'assign', 'allowsubmissionsfromdate_adv', '', NULL),
(450, 2, 1435055113, 'assign', 'duedate', '604800', NULL),
(451, 2, 1435055113, 'assign', 'duedate_enabled', '1', NULL),
(452, 2, 1435055113, 'assign', 'duedate_adv', '', NULL),
(453, 2, 1435055113, 'assign', 'cutoffdate', '1209600', NULL),
(454, 2, 1435055113, 'assign', 'cutoffdate_enabled', '', NULL),
(455, 2, 1435055113, 'assign', 'cutoffdate_adv', '', NULL),
(456, 2, 1435055113, 'assign', 'submissiondrafts', '0', NULL),
(457, 2, 1435055114, 'assign', 'submissiondrafts_adv', '', NULL),
(458, 2, 1435055114, 'assign', 'submissiondrafts_locked', '', NULL),
(459, 2, 1435055114, 'assign', 'requiresubmissionstatement', '0', NULL),
(460, 2, 1435055114, 'assign', 'requiresubmissionstatement_adv', '', NULL),
(461, 2, 1435055114, 'assign', 'requiresubmissionstatement_locked', '', NULL),
(462, 2, 1435055114, 'assign', 'attemptreopenmethod', 'none', NULL),
(463, 2, 1435055114, 'assign', 'attemptreopenmethod_adv', '', NULL),
(464, 2, 1435055114, 'assign', 'attemptreopenmethod_locked', '', NULL),
(465, 2, 1435055114, 'assign', 'maxattempts', '-1', NULL),
(466, 2, 1435055114, 'assign', 'maxattempts_adv', '', NULL),
(467, 2, 1435055114, 'assign', 'maxattempts_locked', '', NULL),
(468, 2, 1435055115, 'assign', 'teamsubmission', '0', NULL),
(469, 2, 1435055115, 'assign', 'teamsubmission_adv', '', NULL),
(470, 2, 1435055115, 'assign', 'teamsubmission_locked', '', NULL),
(471, 2, 1435055115, 'assign', 'requireallteammemberssubmit', '0', NULL),
(472, 2, 1435055115, 'assign', 'requireallteammemberssubmit_adv', '', NULL),
(473, 2, 1435055115, 'assign', 'requireallteammemberssubmit_locked', '', NULL),
(474, 2, 1435055115, 'assign', 'teamsubmissiongroupingid', '', NULL),
(475, 2, 1435055115, 'assign', 'teamsubmissiongroupingid_adv', '', NULL),
(476, 2, 1435055116, 'assign', 'sendnotifications', '0', NULL),
(477, 2, 1435055116, 'assign', 'sendnotifications_adv', '', NULL),
(478, 2, 1435055116, 'assign', 'sendnotifications_locked', '', NULL),
(479, 2, 1435055116, 'assign', 'sendlatenotifications', '0', NULL),
(480, 2, 1435055116, 'assign', 'sendlatenotifications_adv', '', NULL),
(481, 2, 1435055116, 'assign', 'sendlatenotifications_locked', '', NULL),
(482, 2, 1435055116, 'assign', 'sendstudentnotifications', '1', NULL),
(483, 2, 1435055116, 'assign', 'sendstudentnotifications_adv', '', NULL),
(484, 2, 1435055117, 'assign', 'sendstudentnotifications_locked', '', NULL),
(485, 2, 1435055117, 'assign', 'blindmarking', '0', NULL),
(486, 2, 1435055117, 'assign', 'blindmarking_adv', '', NULL),
(487, 2, 1435055117, 'assign', 'blindmarking_locked', '', NULL),
(488, 2, 1435055117, 'assign', 'markingworkflow', '0', NULL),
(489, 2, 1435055117, 'assign', 'markingworkflow_adv', '', NULL),
(490, 2, 1435055117, 'assign', 'markingworkflow_locked', '', NULL),
(491, 2, 1435055117, 'assign', 'markingallocation', '0', NULL),
(492, 2, 1435055117, 'assign', 'markingallocation_adv', '', NULL),
(493, 2, 1435055118, 'assign', 'markingallocation_locked', '', NULL),
(494, 2, 1435055118, 'assign', 'preventsubmissionnotingroup', '0', NULL),
(495, 2, 1435055118, 'assign', 'preventsubmissionnotingroup_adv', '', NULL),
(496, 2, 1435055118, 'assign', 'preventsubmissionnotingroup_locked', '', NULL),
(497, 2, 1435055118, 'assignsubmission_file', 'default', '1', NULL),
(498, 2, 1435055118, 'assignsubmission_file', 'maxfiles', '20', NULL),
(499, 2, 1435055118, 'assignsubmission_file', 'maxbytes', '1048576', NULL),
(500, 2, 1435055118, 'assignsubmission_onlinetext', 'default', '0', NULL),
(501, 2, 1435055118, 'assignfeedback_comments', 'default', '1', NULL),
(502, 2, 1435055119, 'assignfeedback_comments', 'inline', '0', NULL),
(503, 2, 1435055119, 'assignfeedback_comments', 'inline_adv', '', NULL),
(504, 2, 1435055119, 'assignfeedback_comments', 'inline_locked', '', NULL),
(505, 2, 1435055119, 'assignfeedback_editpdf', 'stamps', '', NULL),
(506, 2, 1435055119, 'assignfeedback_file', 'default', '0', NULL),
(507, 2, 1435055119, 'assignfeedback_offline', 'default', '0', NULL),
(508, 2, 1435055119, 'book', 'numberingoptions', '0,1,2,3', NULL),
(509, 2, 1435055119, 'book', 'navoptions', '0,1,2', NULL),
(510, 2, 1435055119, 'book', 'numbering', '1', NULL),
(511, 2, 1435055120, 'book', 'navstyle', '1', NULL),
(512, 2, 1435055120, NULL, 'chat_method', 'ajax', NULL),
(513, 2, 1435055120, NULL, 'chat_refresh_userlist', '10', NULL),
(514, 2, 1435055120, NULL, 'chat_old_ping', '35', NULL),
(515, 2, 1435055120, NULL, 'chat_refresh_room', '5', NULL),
(516, 2, 1435055120, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(517, 2, 1435055121, NULL, 'chat_serverhost', 'localhost', NULL),
(518, 2, 1435055121, NULL, 'chat_serverip', '127.0.0.1', NULL),
(519, 2, 1435055121, NULL, 'chat_serverport', '9111', NULL),
(520, 2, 1435055121, NULL, 'chat_servermax', '100', NULL),
(521, 2, 1435055121, NULL, 'data_enablerssfeeds', '0', NULL),
(522, 2, 1435055122, NULL, 'feedback_allowfullanonymous', '0', NULL),
(523, 2, 1435055122, 'folder', 'showexpanded', '1', NULL),
(524, 2, 1435055123, NULL, 'forum_displaymode', '3', NULL),
(525, 2, 1435055124, NULL, 'forum_replytouser', '1', NULL),
(526, 2, 1435055124, NULL, 'forum_shortpost', '300', NULL),
(527, 2, 1435055124, NULL, 'forum_longpost', '600', NULL),
(528, 2, 1435055125, NULL, 'forum_manydiscussions', '100', NULL),
(529, 2, 1435055125, NULL, 'forum_maxbytes', '512000', NULL),
(530, 2, 1435055125, NULL, 'forum_maxattachments', '9', NULL),
(531, 2, 1435055125, NULL, 'forum_trackingtype', '1', NULL),
(532, 2, 1435055125, NULL, 'forum_trackreadposts', '1', NULL),
(533, 2, 1435055125, NULL, 'forum_allowforcedreadtracking', '0', NULL),
(534, 2, 1435055126, NULL, 'forum_oldpostdays', '14', NULL),
(535, 2, 1435055126, NULL, 'forum_usermarksread', '0', NULL),
(536, 2, 1435055126, NULL, 'forum_cleanreadtime', '2', NULL),
(537, 2, 1435055126, NULL, 'digestmailtime', '17', NULL),
(538, 2, 1435055126, NULL, 'forum_enablerssfeeds', '0', NULL),
(539, 2, 1435055126, NULL, 'forum_enabletimedposts', '0', NULL),
(540, 2, 1435055126, NULL, 'glossary_entbypage', '10', NULL),
(541, 2, 1435055127, NULL, 'glossary_dupentries', '0', NULL),
(542, 2, 1435055127, NULL, 'glossary_allowcomments', '0', NULL),
(543, 2, 1435055127, NULL, 'glossary_linkbydefault', '1', NULL),
(544, 2, 1435055127, NULL, 'glossary_defaultapproval', '1', NULL),
(545, 2, 1435055127, NULL, 'glossary_enablerssfeeds', '0', NULL),
(546, 2, 1435055127, NULL, 'glossary_linkentries', '0', NULL),
(547, 2, 1435055127, NULL, 'glossary_casesensitive', '0', NULL),
(548, 2, 1435055128, NULL, 'glossary_fullmatch', '0', NULL),
(549, 2, 1435055128, 'imscp', 'keepold', '1', NULL),
(550, 2, 1435055128, 'imscp', 'keepold_adv', '', NULL),
(551, 2, 1435055128, 'label', 'dndmedia', '1', NULL),
(552, 2, 1435055128, 'label', 'dndresizewidth', '400', NULL),
(553, 2, 1435055128, 'label', 'dndresizeheight', '400', NULL),
(554, 2, 1435055128, NULL, 'lesson_slideshowwidth', '640', NULL),
(555, 2, 1435055128, NULL, 'lesson_slideshowheight', '480', NULL),
(556, 2, 1435055129, NULL, 'lesson_slideshowbgcolor', '#FFFFFF', NULL),
(557, 2, 1435055129, NULL, 'lesson_mediawidth', '640', NULL),
(558, 2, 1435055129, NULL, 'lesson_mediaheight', '480', NULL),
(559, 2, 1435055129, NULL, 'lesson_mediaclose', '0', NULL),
(560, 2, 1435055129, NULL, 'lesson_maxhighscores', '10', NULL),
(561, 2, 1435055129, NULL, 'lesson_maxanswers', '4', NULL),
(562, 2, 1435055129, NULL, 'lesson_defaultnextpage', '0', NULL),
(563, 2, 1435055130, 'page', 'displayoptions', '5', NULL),
(564, 2, 1435055130, 'page', 'printheading', '1', NULL),
(565, 2, 1435055130, 'page', 'printintro', '0', NULL),
(566, 2, 1435055130, 'page', 'display', '5', NULL),
(567, 2, 1435055130, 'page', 'popupwidth', '620', NULL),
(568, 2, 1435055130, 'page', 'popupheight', '450', NULL),
(569, 2, 1435055130, 'quiz', 'timelimit', '0', NULL),
(570, 2, 1435055130, 'quiz', 'timelimit_adv', '', NULL),
(571, 2, 1435055131, 'quiz', 'overduehandling', 'autosubmit', NULL),
(572, 2, 1435055131, 'quiz', 'overduehandling_adv', '', NULL),
(573, 2, 1435055131, 'quiz', 'graceperiod', '86400', NULL),
(574, 2, 1435055131, 'quiz', 'graceperiod_adv', '', NULL),
(575, 2, 1435055131, 'quiz', 'graceperiodmin', '60', NULL),
(576, 2, 1435055131, 'quiz', 'attempts', '0', NULL),
(577, 2, 1435055131, 'quiz', 'attempts_adv', '', NULL),
(578, 2, 1435055131, 'quiz', 'grademethod', '1', NULL),
(579, 2, 1435055132, 'quiz', 'grademethod_adv', '', NULL),
(580, 2, 1435055132, 'quiz', 'maximumgrade', '10', NULL),
(581, 2, 1435055132, 'quiz', 'questionsperpage', '1', NULL),
(582, 2, 1435055132, 'quiz', 'questionsperpage_adv', '', NULL),
(583, 2, 1435055132, 'quiz', 'navmethod', 'free', NULL),
(584, 2, 1435055132, 'quiz', 'navmethod_adv', '1', NULL),
(585, 2, 1435055132, 'quiz', 'shuffleanswers', '1', NULL),
(586, 2, 1435055132, 'quiz', 'shuffleanswers_adv', '', NULL),
(587, 2, 1435055133, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(588, 2, 1435055133, 'quiz', 'canredoquestions', '0', NULL),
(589, 2, 1435055133, 'quiz', 'canredoquestions_adv', '1', NULL),
(590, 2, 1435055133, 'quiz', 'attemptonlast', '0', NULL),
(591, 2, 1435055133, 'quiz', 'attemptonlast_adv', '1', NULL),
(592, 2, 1435055133, 'quiz', 'reviewattempt', '69904', NULL),
(593, 2, 1435055133, 'quiz', 'reviewcorrectness', '69904', NULL),
(594, 2, 1435055133, 'quiz', 'reviewmarks', '69904', NULL),
(595, 2, 1435055134, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(596, 2, 1435055134, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(597, 2, 1435055134, 'quiz', 'reviewrightanswer', '69904', NULL),
(598, 2, 1435055134, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(599, 2, 1435055136, 'quiz', 'showuserpicture', '0', NULL),
(600, 2, 1435055137, 'quiz', 'showuserpicture_adv', '', NULL),
(601, 2, 1435055137, 'quiz', 'decimalpoints', '2', NULL),
(602, 2, 1435055137, 'quiz', 'decimalpoints_adv', '', NULL),
(603, 2, 1435055137, 'quiz', 'questiondecimalpoints', '-1', NULL),
(604, 2, 1435055137, 'quiz', 'questiondecimalpoints_adv', '1', NULL),
(605, 2, 1435055137, 'quiz', 'showblocks', '0', NULL),
(606, 2, 1435055137, 'quiz', 'showblocks_adv', '1', NULL),
(607, 2, 1435055137, 'quiz', 'password', '', NULL),
(608, 2, 1435055138, 'quiz', 'password_adv', '1', NULL),
(609, 2, 1435055138, 'quiz', 'subnet', '', NULL),
(610, 2, 1435055138, 'quiz', 'subnet_adv', '1', NULL),
(611, 2, 1435055138, 'quiz', 'delay1', '0', NULL),
(612, 2, 1435055138, 'quiz', 'delay1_adv', '1', NULL),
(613, 2, 1435055138, 'quiz', 'delay2', '0', NULL),
(614, 2, 1435055138, 'quiz', 'delay2_adv', '1', NULL),
(615, 2, 1435055138, 'quiz', 'browsersecurity', '-', NULL),
(616, 2, 1435055138, 'quiz', 'browsersecurity_adv', '1', NULL),
(617, 2, 1435055139, 'quiz', 'autosaveperiod', '60', NULL),
(618, 2, 1435055139, 'resource', 'framesize', '130', NULL),
(619, 2, 1435055139, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(620, 2, 1435055139, 'resource', 'printintro', '1', NULL),
(621, 2, 1435055139, 'resource', 'display', '0', NULL),
(622, 2, 1435055139, 'resource', 'showsize', '0', NULL),
(623, 2, 1435055139, 'resource', 'showtype', '0', NULL),
(624, 2, 1435055139, 'resource', 'popupwidth', '620', NULL),
(625, 2, 1435055139, 'resource', 'popupheight', '450', NULL),
(626, 2, 1435055139, 'resource', 'filterfiles', '0', NULL),
(627, 2, 1435055140, 'scorm', 'displaycoursestructure', '0', NULL),
(628, 2, 1435055140, 'scorm', 'displaycoursestructure_adv', '', NULL),
(629, 2, 1435055140, 'scorm', 'popup', '0', NULL),
(630, 2, 1435055140, 'scorm', 'popup_adv', '', NULL),
(631, 2, 1435055140, 'scorm', 'displayactivityname', '1', NULL),
(632, 2, 1435055140, 'scorm', 'framewidth', '100', NULL),
(633, 2, 1435055140, 'scorm', 'framewidth_adv', '1', NULL),
(634, 2, 1435055140, 'scorm', 'frameheight', '500', NULL),
(635, 2, 1435055140, 'scorm', 'frameheight_adv', '1', NULL),
(636, 2, 1435055141, 'scorm', 'winoptgrp_adv', '1', NULL),
(637, 2, 1435055141, 'scorm', 'scrollbars', '0', NULL),
(638, 2, 1435055141, 'scorm', 'directories', '0', NULL),
(639, 2, 1435055141, 'scorm', 'location', '0', NULL),
(640, 2, 1435055141, 'scorm', 'menubar', '0', NULL),
(641, 2, 1435055141, 'scorm', 'toolbar', '0', NULL),
(642, 2, 1435055141, 'scorm', 'status', '0', NULL),
(643, 2, 1435055141, 'scorm', 'skipview', '0', NULL),
(644, 2, 1435055141, 'scorm', 'skipview_adv', '1', NULL),
(645, 2, 1435055141, 'scorm', 'hidebrowse', '0', NULL),
(646, 2, 1435055142, 'scorm', 'hidebrowse_adv', '1', NULL),
(647, 2, 1435055142, 'scorm', 'hidetoc', '0', NULL),
(648, 2, 1435055142, 'scorm', 'hidetoc_adv', '1', NULL),
(649, 2, 1435055142, 'scorm', 'nav', '1', NULL),
(650, 2, 1435055142, 'scorm', 'nav_adv', '1', NULL),
(651, 2, 1435055142, 'scorm', 'navpositionleft', '-100', NULL),
(652, 2, 1435055142, 'scorm', 'navpositionleft_adv', '1', NULL),
(653, 2, 1435055142, 'scorm', 'navpositiontop', '-100', NULL),
(654, 2, 1435055142, 'scorm', 'navpositiontop_adv', '1', NULL),
(655, 2, 1435055143, 'scorm', 'collapsetocwinsize', '767', NULL),
(656, 2, 1435055143, 'scorm', 'collapsetocwinsize_adv', '1', NULL),
(657, 2, 1435055143, 'scorm', 'displayattemptstatus', '1', NULL),
(658, 2, 1435055143, 'scorm', 'displayattemptstatus_adv', '', NULL),
(659, 2, 1435055143, 'scorm', 'grademethod', '1', NULL),
(660, 2, 1435055143, 'scorm', 'maxgrade', '100', NULL),
(661, 2, 1435055143, 'scorm', 'maxattempt', '0', NULL),
(662, 2, 1435055143, 'scorm', 'whatgrade', '0', NULL),
(663, 2, 1435055143, 'scorm', 'forcecompleted', '0', NULL),
(664, 2, 1435055144, 'scorm', 'forcenewattempt', '0', NULL),
(665, 2, 1435055144, 'scorm', 'autocommit', '0', NULL),
(666, 2, 1435055144, 'scorm', 'lastattemptlock', '0', NULL),
(667, 2, 1435055144, 'scorm', 'auto', '0', NULL),
(668, 2, 1435055144, 'scorm', 'updatefreq', '0', NULL),
(669, 2, 1435055144, 'scorm', 'scorm12standard', '1', NULL),
(670, 2, 1435055144, 'scorm', 'allowtypeexternal', '0', NULL),
(671, 2, 1435055144, 'scorm', 'allowtypelocalsync', '0', NULL),
(672, 2, 1435055144, 'scorm', 'allowtypeexternalaicc', '0', NULL),
(673, 2, 1435055145, 'scorm', 'allowaicchacp', '0', NULL),
(674, 2, 1435055145, 'scorm', 'aicchacptimeout', '30', NULL),
(675, 2, 1435055145, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
(676, 2, 1435055145, 'scorm', 'aiccuserid', '1', NULL),
(677, 2, 1435055145, 'scorm', 'forcejavascript', '1', NULL),
(678, 2, 1435055145, 'scorm', 'allowapidebug', '0', NULL),
(679, 2, 1435055145, 'scorm', 'apidebugmask', '.*', NULL),
(680, 2, 1435055145, 'url', 'framesize', '130', NULL),
(681, 2, 1435055145, 'url', 'secretphrase', '', NULL),
(682, 2, 1435055146, 'url', 'rolesinparams', '0', NULL),
(683, 2, 1435055146, 'url', 'displayoptions', '0,1,5,6', NULL),
(684, 2, 1435055146, 'url', 'printintro', '1', NULL),
(685, 2, 1435055146, 'url', 'display', '0', NULL),
(686, 2, 1435055146, 'url', 'popupwidth', '620', NULL),
(687, 2, 1435055146, 'url', 'popupheight', '450', NULL),
(688, 2, 1435055146, 'workshop', 'grade', '80', NULL),
(689, 2, 1435055146, 'workshop', 'gradinggrade', '20', NULL),
(690, 2, 1435055146, 'workshop', 'gradedecimals', '0', NULL),
(691, 2, 1435055146, 'workshop', 'maxbytes', '0', NULL),
(692, 2, 1435055147, 'workshop', 'strategy', 'accumulative', NULL),
(693, 2, 1435055147, 'workshop', 'examplesmode', '0', NULL),
(694, 2, 1435055147, 'workshopallocation_random', 'numofreviews', '5', NULL),
(695, 2, 1435055147, 'workshopform_numerrors', 'grade0', 'No', NULL),
(696, 2, 1435055147, 'workshopform_numerrors', 'grade1', 'Yes', NULL),
(697, 2, 1435055147, 'workshopeval_best', 'comparison', '5', NULL),
(698, 2, 1435055147, NULL, 'block_course_list_adminview', 'all', NULL),
(699, 2, 1435055147, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(700, 2, 1435055147, 'block_course_overview', 'defaultmaxcourses', '10', NULL),
(701, 2, 1435055148, 'block_course_overview', 'forcedefaultmaxcourses', '0', NULL),
(702, 2, 1435055148, 'block_course_overview', 'showchildren', '0', NULL),
(703, 2, 1435055148, 'block_course_overview', 'showwelcomearea', '0', NULL),
(704, 2, 1435055148, 'block_course_overview', 'showcategories', '0', NULL),
(705, 2, 1435055148, NULL, 'block_html_allowcssclasses', '0', NULL),
(706, 2, 1435055148, NULL, 'block_online_users_timetosee', '5', NULL),
(707, 2, 1435055148, NULL, 'block_rss_client_num_entries', '5', NULL),
(708, 2, 1435055149, NULL, 'block_rss_client_timeout', '30', NULL),
(709, 2, 1435055149, 'block_section_links', 'numsections1', '22', NULL),
(710, 2, 1435055149, 'block_section_links', 'incby1', '2', NULL),
(711, 2, 1435055149, 'block_section_links', 'numsections2', '40', NULL),
(712, 2, 1435055149, 'block_section_links', 'incby2', '5', NULL),
(713, 2, 1435055149, NULL, 'block_tags_showcoursetags', '0', NULL),
(714, 2, 1435055150, 'format_singleactivity', 'activitytype', 'forum', NULL),
(715, 2, 1435055150, 'enrol_cohort', 'roleid', '5', NULL),
(716, 2, 1435055150, 'enrol_cohort', 'unenrolaction', '0', NULL),
(717, 2, 1435055150, 'enrol_database', 'dbtype', '', NULL),
(718, 2, 1435055150, 'enrol_database', 'dbhost', 'localhost', NULL),
(719, 2, 1435055150, 'enrol_database', 'dbuser', '', NULL),
(720, 2, 1435055150, 'enrol_database', 'dbpass', '', NULL),
(721, 2, 1435055150, 'enrol_database', 'dbname', '', NULL),
(722, 2, 1435055151, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(723, 2, 1435055151, 'enrol_database', 'dbsetupsql', '', NULL),
(724, 2, 1435055151, 'enrol_database', 'dbsybasequoting', '0', NULL),
(725, 2, 1435055151, 'enrol_database', 'debugdb', '0', NULL),
(726, 2, 1435055151, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(727, 2, 1435055151, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(728, 2, 1435055151, 'enrol_database', 'localrolefield', 'shortname', NULL),
(729, 2, 1435055151, 'enrol_database', 'localcategoryfield', 'id', NULL),
(730, 2, 1435055151, 'enrol_database', 'remoteenroltable', '', NULL),
(731, 2, 1435055152, 'enrol_database', 'remotecoursefield', '', NULL),
(732, 2, 1435055152, 'enrol_database', 'remoteuserfield', '', NULL),
(733, 2, 1435055152, 'enrol_database', 'remoterolefield', '', NULL),
(734, 2, 1435055152, 'enrol_database', 'remoteotheruserfield', '', NULL),
(735, 2, 1435055152, 'enrol_database', 'defaultrole', '5', NULL),
(736, 2, 1435055152, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(737, 2, 1435055152, 'enrol_database', 'unenrolaction', '0', NULL),
(738, 2, 1435055152, 'enrol_database', 'newcoursetable', '', NULL),
(739, 2, 1435055152, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(740, 2, 1435055153, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
(741, 2, 1435055153, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(742, 2, 1435055153, 'enrol_database', 'newcoursecategory', '', NULL),
(743, 2, 1435055153, 'enrol_database', 'defaultcategory', '1', NULL),
(744, 2, 1435055153, 'enrol_database', 'templatecourse', '', NULL);
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(745, 2, 1435055153, 'enrol_flatfile', 'location', '', NULL),
(746, 2, 1435055153, 'enrol_flatfile', 'encoding', 'UTF-8', NULL),
(747, 2, 1435055153, 'enrol_flatfile', 'mailstudents', '0', NULL),
(748, 2, 1435055153, 'enrol_flatfile', 'mailteachers', '0', NULL),
(749, 2, 1435055153, 'enrol_flatfile', 'mailadmins', '0', NULL),
(750, 2, 1435055154, 'enrol_flatfile', 'unenrolaction', '3', NULL),
(751, 2, 1435055154, 'enrol_flatfile', 'expiredaction', '3', NULL),
(752, 2, 1435055154, 'enrol_guest', 'requirepassword', '0', NULL),
(753, 2, 1435055154, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(754, 2, 1435055154, 'enrol_guest', 'showhint', '0', NULL),
(755, 2, 1435055154, 'enrol_guest', 'defaultenrol', '1', NULL),
(756, 2, 1435055154, 'enrol_guest', 'status', '1', NULL),
(757, 2, 1435055155, 'enrol_guest', 'status_adv', '', NULL),
(758, 2, 1435055155, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(759, 2, 1435055155, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(760, 2, 1435055155, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(761, 2, 1435055155, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(762, 2, 1435055155, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(763, 2, 1435055155, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(764, 2, 1435055156, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(765, 2, 1435055156, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(766, 2, 1435055156, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(767, 2, 1435055156, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(768, 2, 1435055156, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(769, 2, 1435055156, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
(770, 2, 1435055156, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(771, 2, 1435055156, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(772, 2, 1435055156, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(773, 2, 1435055157, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(774, 2, 1435055157, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(775, 2, 1435055157, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(776, 2, 1435055157, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(777, 2, 1435055157, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(778, 2, 1435055157, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode', NULL),
(779, 2, 1435055157, 'enrol_imsenterprise', 'imscoursemapfullname', 'short', NULL),
(780, 2, 1435055157, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore', NULL),
(781, 2, 1435055158, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(782, 2, 1435055158, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(783, 2, 1435055158, 'enrol_manual', 'expiredaction', '1', NULL),
(784, 2, 1435055158, 'enrol_manual', 'expirynotifyhour', '6', NULL),
(785, 2, 1435055158, 'enrol_manual', 'defaultenrol', '1', NULL),
(786, 2, 1435055158, 'enrol_manual', 'status', '0', NULL),
(787, 2, 1435055158, 'enrol_manual', 'roleid', '5', NULL),
(788, 2, 1435055158, 'enrol_manual', 'enrolperiod', '0', NULL),
(789, 2, 1435055159, 'enrol_manual', 'expirynotify', '0', NULL),
(790, 2, 1435055159, 'enrol_manual', 'expirythreshold', '86400', NULL),
(791, 2, 1435055159, 'enrol_meta', 'nosyncroleids', '', NULL),
(792, 2, 1435055159, 'enrol_meta', 'syncall', '1', NULL),
(793, 2, 1435055159, 'enrol_meta', 'unenrolaction', '3', NULL),
(794, 2, 1435055159, 'enrol_meta', 'coursesort', 'sortorder', NULL),
(795, 2, 1435055159, 'enrol_mnet', 'roleid', '5', NULL),
(796, 2, 1435055159, 'enrol_mnet', 'roleid_adv', '1', NULL),
(797, 2, 1435055159, 'enrol_paypal', 'paypalbusiness', '', NULL),
(798, 2, 1435055159, 'enrol_paypal', 'mailstudents', '0', NULL),
(799, 2, 1435055160, 'enrol_paypal', 'mailteachers', '0', NULL),
(800, 2, 1435055160, 'enrol_paypal', 'mailadmins', '0', NULL),
(801, 2, 1435055160, 'enrol_paypal', 'expiredaction', '3', NULL),
(802, 2, 1435055160, 'enrol_paypal', 'status', '1', NULL),
(803, 2, 1435055160, 'enrol_paypal', 'cost', '0', NULL),
(804, 2, 1435055160, 'enrol_paypal', 'currency', 'USD', NULL),
(805, 2, 1435055160, 'enrol_paypal', 'roleid', '5', NULL),
(806, 2, 1435055160, 'enrol_paypal', 'enrolperiod', '0', NULL),
(807, 2, 1435055160, 'enrol_self', 'requirepassword', '0', NULL),
(808, 2, 1435055160, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(809, 2, 1435055161, 'enrol_self', 'showhint', '0', NULL),
(810, 2, 1435055161, 'enrol_self', 'expiredaction', '1', NULL),
(811, 2, 1435055161, 'enrol_self', 'expirynotifyhour', '6', NULL),
(812, 2, 1435055161, 'enrol_self', 'defaultenrol', '1', NULL),
(813, 2, 1435055161, 'enrol_self', 'status', '1', NULL),
(814, 2, 1435055161, 'enrol_self', 'newenrols', '1', NULL),
(815, 2, 1435055161, 'enrol_self', 'groupkey', '0', NULL),
(816, 2, 1435055161, 'enrol_self', 'roleid', '5', NULL),
(817, 2, 1435055161, 'enrol_self', 'enrolperiod', '0', NULL),
(818, 2, 1435055161, 'enrol_self', 'expirynotify', '0', NULL),
(819, 2, 1435055162, 'enrol_self', 'expirythreshold', '86400', NULL),
(820, 2, 1435055162, 'enrol_self', 'longtimenosee', '0', NULL),
(821, 2, 1435055162, 'enrol_self', 'maxenrolled', '0', NULL),
(822, 2, 1435055162, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(823, 2, 1435055162, NULL, 'filter_censor_badwords', '', NULL),
(824, 2, 1435055162, 'filter_emoticon', 'formats', '1,4,0', NULL),
(825, 2, 1435055162, 'filter_mathjaxloader', 'httpurl', 'http://cdn.mathjax.org/mathjax/2.5-latest/MathJax.js', NULL),
(826, 2, 1435055162, 'filter_mathjaxloader', 'httpsurl', 'https://cdn.mathjax.org/mathjax/2.5-latest/MathJax.js', NULL),
(827, 2, 1435055163, 'filter_mathjaxloader', 'texfiltercompatibility', '0', NULL),
(828, 2, 1435055163, 'filter_mathjaxloader', 'mathjaxconfig', '\nMathJax.Hub.Config({\n    config: ["Accessible.js", "Safe.js"],\n    errorSettings: { message: ["!"] },\n    skipStartupTypeset: true,\n    messageStyle: "none"\n});\n', NULL),
(829, 2, 1435055163, 'filter_mathjaxloader', 'additionaldelimiters', '', NULL),
(830, 2, 1435055163, NULL, 'filter_multilang_force_old', '0', NULL),
(831, 2, 1435055163, 'filter_tex', 'latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(832, 2, 1435055163, 'filter_tex', 'latexbackground', '#FFFFFF', NULL),
(833, 2, 1435055163, 'filter_tex', 'density', '120', NULL),
(834, 2, 1435055163, 'filter_tex', 'pathlatex', 'c:\\texmf\\miktex\\bin\\latex.exe', NULL),
(835, 2, 1435055163, 'filter_tex', 'pathdvips', 'c:\\texmf\\miktex\\bin\\dvips.exe', NULL),
(836, 2, 1435055163, 'filter_tex', 'pathconvert', 'c:\\imagemagick\\convert.exe', NULL),
(837, 2, 1435055164, 'filter_tex', 'pathdvisvgm', 'c:\\texmf\\miktex\\bin\\dvisvgm.exe', NULL),
(838, 2, 1435055164, 'filter_tex', 'pathmimetex', '', NULL),
(839, 2, 1435055164, 'filter_tex', 'convertformat', 'gif', NULL),
(840, 2, 1435055164, 'filter_urltolink', 'formats', '0', NULL),
(841, 2, 1435055164, 'filter_urltolink', 'embedimages', '1', NULL),
(842, 2, 1435055164, 'logstore_database', 'dbdriver', '', NULL),
(843, 2, 1435055164, 'logstore_database', 'dbhost', '', NULL),
(844, 2, 1435055165, 'logstore_database', 'dbuser', '', NULL),
(845, 2, 1435055165, 'logstore_database', 'dbpass', '', NULL),
(846, 2, 1435055165, 'logstore_database', 'dbname', '', NULL),
(847, 2, 1435055165, 'logstore_database', 'dbtable', '', NULL),
(848, 2, 1435055165, 'logstore_database', 'dbpersist', '0', NULL),
(849, 2, 1435055165, 'logstore_database', 'dbsocket', '', NULL),
(850, 2, 1435055165, 'logstore_database', 'dbport', '', NULL),
(851, 2, 1435055165, 'logstore_database', 'dbschema', '', NULL),
(852, 2, 1435055165, 'logstore_database', 'dbcollation', '', NULL),
(853, 2, 1435055165, 'logstore_database', 'buffersize', '50', NULL),
(854, 2, 1435055166, 'logstore_database', 'logguests', '0', NULL),
(855, 2, 1435055166, 'logstore_database', 'includelevels', '1,2,0', NULL),
(856, 2, 1435055166, 'logstore_database', 'includeactions', 'c,r,u,d', NULL),
(857, 2, 1435055166, 'logstore_legacy', 'loglegacy', '0', NULL),
(858, 2, 1435055166, NULL, 'logguests', '1', NULL),
(859, 2, 1435055166, NULL, 'loglifetime', '0', NULL),
(860, 2, 1435055166, 'logstore_standard', 'logguests', '1', NULL),
(861, 2, 1435055166, 'logstore_standard', 'loglifetime', '0', NULL),
(862, 2, 1435055166, 'logstore_standard', 'buffersize', '50', NULL),
(863, 2, 1435055167, NULL, 'airnotifierurl', 'https://messages.moodle.net', NULL),
(864, 2, 1435055167, NULL, 'airnotifierport', '443', NULL),
(865, 2, 1435055167, NULL, 'airnotifiermobileappname', 'com.moodle.moodlemobile', NULL),
(866, 2, 1435055167, NULL, 'airnotifierappname', 'commoodlemoodlemobile', NULL),
(867, 2, 1435055167, NULL, 'airnotifieraccesskey', '', NULL),
(868, 2, 1435055167, NULL, 'smtphosts', '', NULL),
(869, 2, 1435055168, NULL, 'smtpsecure', '', NULL),
(870, 2, 1435055168, NULL, 'smtpuser', '', NULL),
(871, 2, 1435055168, NULL, 'smtppass', '', NULL),
(872, 2, 1435055168, NULL, 'smtpmaxbulk', '1', NULL),
(873, 2, 1435055168, NULL, 'noreplyaddress', 'noreply@localhost', NULL),
(874, 2, 1435055168, NULL, 'emailonlyfromnoreplyaddress', '0', NULL),
(875, 2, 1435055168, NULL, 'sitemailcharset', '0', NULL),
(876, 2, 1435055169, NULL, 'allowusermailcharset', '0', NULL),
(877, 2, 1435055169, NULL, 'allowattachments', '1', NULL),
(878, 2, 1435055169, NULL, 'mailnewline', 'LF', NULL),
(879, 2, 1435055169, NULL, 'jabberhost', '', NULL),
(880, 2, 1435055169, NULL, 'jabberserver', '', NULL),
(881, 2, 1435055169, NULL, 'jabberusername', '', NULL),
(882, 2, 1435055169, NULL, 'jabberpassword', '', NULL),
(883, 2, 1435055170, NULL, 'jabberport', '5222', NULL),
(884, 2, 1435055170, 'editor_atto', 'toolbar', 'collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html', NULL),
(885, 2, 1435055170, 'editor_atto', 'autosavefrequency', '60', NULL),
(886, 2, 1435055170, 'atto_collapse', 'showgroups', '5', NULL),
(887, 2, 1435055170, 'atto_equation', 'librarygroup1', '\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n', NULL),
(888, 2, 1435055170, 'atto_equation', 'librarygroup2', '\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n', NULL),
(889, 2, 1435055170, 'atto_equation', 'librarygroup3', '\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n', NULL),
(890, 2, 1435055170, 'atto_equation', 'librarygroup4', '\n\\sum{a,b}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n', NULL),
(891, 2, 1435055170, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen', NULL),
(892, 2, 1435055171, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings', NULL),
(893, 2, 1435055171, 'editor_tinymce', 'customconfig', '', NULL),
(894, 2, 1435055171, 'tinymce_moodleemoticon', 'requireemoticon', '1', NULL),
(895, 2, 1435055171, 'tinymce_spellchecker', 'spellengine', '', NULL),
(896, 2, 1435055171, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
(897, 2, 1435055171, NULL, 'profileroles', '5,4,3', NULL),
(898, 2, 1435055171, NULL, 'coursecontact', '3', NULL),
(899, 2, 1435055171, NULL, 'frontpage', '6', NULL),
(900, 2, 1435055172, NULL, 'frontpageloggedin', '6', NULL),
(901, 2, 1435055172, NULL, 'maxcategorydepth', '2', NULL),
(902, 2, 1435055172, NULL, 'frontpagecourselimit', '200', NULL),
(903, 2, 1435055172, NULL, 'commentsperpage', '15', NULL),
(904, 2, 1435055172, NULL, 'defaultfrontpageroleid', '8', NULL),
(905, 2, 1435055172, NULL, 'supportname', 'Admin User', NULL),
(906, 2, 1435055173, NULL, 'supportemail', 'ptnhuan@gmail.com', NULL),
(907, 2, 1435055173, NULL, 'messageinbound_enabled', '0', NULL),
(908, 2, 1435055173, NULL, 'messageinbound_mailbox', '', NULL),
(909, 2, 1435055173, NULL, 'messageinbound_domain', '', NULL),
(910, 2, 1435055173, NULL, 'messageinbound_host', '', NULL),
(911, 2, 1435055173, NULL, 'messageinbound_hostssl', 'ssl', NULL),
(912, 2, 1435055173, NULL, 'messageinbound_hostuser', '', NULL),
(913, 2, 1435055174, NULL, 'messageinbound_hostpass', '', NULL),
(914, 2, 1435055299, NULL, 'timezone', 'Asia/Ho_Chi_Minh', NULL),
(915, 2, 1435055299, NULL, 'registerauth', '', NULL),
(916, 2, 1435059660, NULL, 'custommenuitems', 'alo', ''),
(917, 2, 1435059660, NULL, 'customusermenuitems', 'grades,grades|/grade/report/mygrades.php|grades\r\nmessages,message|/message/index.php|message\r\npreferences,moodle|/user/preferences.php|preferences', 'grades,grades|/grade/report/mygrades.php|grades\nmessages,message|/message/index.php|message\npreferences,moodle|/user/preferences.php|preferences'),
(918, 2, 1435059729, NULL, 'custommenuitems', 'Moodle community|https://moodle.org\r\n-Moodle free support|https://moodle.org/support\r\n-###\r\n-Moodle development|https://moodle.org/development\r\n--Moodle Docs|http://docs.moodle.org|Moodle Docs\r\n--German Moodle Docs|http://docs.moodle.org/de|Documentation in German|de\r\n#####\r\nMoodle.com|http://moodle.com/', 'alo'),
(919, 2, 1435142068, NULL, 'defaulthomepage', '0', '1'),
(920, 2, 1435142705, 'theme_essential', 'pagebackground', '', NULL),
(921, 2, 1435142705, 'theme_essential', 'pagebackgroundstyle', 'fixed', NULL),
(922, 2, 1435142705, 'theme_essential', 'pagewidth', '1200', NULL),
(923, 2, 1435142705, 'theme_essential', 'layout', '', NULL),
(924, 2, 1435142705, 'theme_essential', 'breadcrumbstyle', '1', NULL),
(925, 2, 1435142705, 'theme_essential', 'fitvids', '1', NULL),
(926, 2, 1435142706, 'theme_essential', 'customcss', '', NULL),
(927, 2, 1435142706, 'theme_essential', 'themecolor', '#30add1', NULL),
(928, 2, 1435142706, 'theme_essential', 'themetextcolor', '#217a94', NULL),
(929, 2, 1435142706, 'theme_essential', 'themeurlcolor', '#943b21', NULL),
(930, 2, 1435142706, 'theme_essential', 'themehovercolor', '#6a2a18', NULL),
(931, 2, 1435142707, 'theme_essential', 'themeiconcolor', '#30add1', NULL),
(932, 2, 1435142707, 'theme_essential', 'themenavcolor', '#ffffff', NULL),
(933, 2, 1435142707, 'theme_essential', 'footercolor', '#555555', NULL),
(934, 2, 1435142708, 'theme_essential', 'footertextcolor', '#bbbbbb', NULL),
(935, 2, 1435142708, 'theme_essential', 'footerheadingcolor', '#cccccc', NULL),
(936, 2, 1435142708, 'theme_essential', 'footersepcolor', '#313131', NULL),
(937, 2, 1435142709, 'theme_essential', 'footerurlcolor', '#217a94', NULL),
(938, 2, 1435142709, 'theme_essential', 'footerhovercolor', '#30add1', NULL),
(939, 2, 1435142709, 'theme_essential', 'enablealternativethemecolors1', '', NULL),
(940, 2, 1435142709, 'theme_essential', 'alternativethemename1', 'Alternative colours 1', NULL),
(941, 2, 1435142709, 'theme_essential', 'alternativethemecolor1', '#a430d1', NULL),
(942, 2, 1435142710, 'theme_essential', 'alternativethemetextcolor1', '#a430d1', NULL),
(943, 2, 1435142710, 'theme_essential', 'alternativethemeurlcolor1', '#a430d1', NULL),
(944, 2, 1435142710, 'theme_essential', 'alternativethemehovercolor1', '#9929c4', NULL),
(945, 2, 1435142710, 'theme_essential', 'enablealternativethemecolors2', '', NULL),
(946, 2, 1435142711, 'theme_essential', 'alternativethemename2', 'Alternative colours 2', NULL),
(947, 2, 1435142711, 'theme_essential', 'alternativethemecolor2', '#d15430', NULL),
(948, 2, 1435142711, 'theme_essential', 'alternativethemetextcolor2', '#d15430', NULL),
(949, 2, 1435142711, 'theme_essential', 'alternativethemeurlcolor2', '#d15430', NULL),
(950, 2, 1435142711, 'theme_essential', 'alternativethemehovercolor2', '#c44c29', NULL),
(951, 2, 1435142711, 'theme_essential', 'enablealternativethemecolors3', '', NULL),
(952, 2, 1435142712, 'theme_essential', 'alternativethemename3', 'Alternative colours 3', NULL),
(953, 2, 1435142712, 'theme_essential', 'alternativethemecolor3', '#5dd130', NULL),
(954, 2, 1435142712, 'theme_essential', 'alternativethemetextcolor3', '#5dd130', NULL),
(955, 2, 1435142712, 'theme_essential', 'alternativethemeurlcolor3', '#5dd130', NULL),
(956, 2, 1435142713, 'theme_essential', 'alternativethemehovercolor3', '#53c429', NULL),
(957, 2, 1435142713, 'theme_essential', 'oldnavbar', '', NULL),
(958, 2, 1435142713, 'theme_essential', 'siteicon', 'laptop', NULL),
(959, 2, 1435142713, 'theme_essential', 'logo', '', NULL),
(960, 2, 1435142713, 'theme_essential', 'headertitle', '1', NULL),
(961, 2, 1435142714, 'theme_essential', 'navbartitle', '2', NULL),
(962, 2, 1435142714, 'theme_essential', 'headerbackground', '', NULL),
(963, 2, 1435142714, 'theme_essential', 'headertextcolor', '#217a94', NULL),
(964, 2, 1435142714, 'theme_essential', 'displaymycourses', '1', NULL),
(965, 2, 1435142714, 'theme_essential', 'mycoursetitle', 'course', NULL),
(966, 2, 1435142714, 'theme_essential', 'helplinktype', '1', NULL),
(967, 2, 1435142715, 'theme_essential', 'helplink', '', NULL),
(968, 2, 1435142715, 'theme_essential', 'website', '', NULL),
(969, 2, 1435142715, 'theme_essential', 'facebook', '', NULL),
(970, 2, 1435142715, 'theme_essential', 'flickr', '', NULL),
(971, 2, 1435142715, 'theme_essential', 'twitter', '', NULL),
(972, 2, 1435142716, 'theme_essential', 'googleplus', '', NULL),
(973, 2, 1435142716, 'theme_essential', 'linkedin', '', NULL),
(974, 2, 1435142716, 'theme_essential', 'pinterest', '', NULL),
(975, 2, 1435142716, 'theme_essential', 'instagram', '', NULL),
(976, 2, 1435142716, 'theme_essential', 'youtube', '', NULL),
(977, 2, 1435142717, 'theme_essential', 'skype', '', NULL),
(978, 2, 1435142717, 'theme_essential', 'vk', '', NULL),
(979, 2, 1435142717, 'theme_essential', 'android', '', NULL),
(980, 2, 1435142717, 'theme_essential', 'windows', '', NULL),
(981, 2, 1435142717, 'theme_essential', 'winphone', '', NULL),
(982, 2, 1435142718, 'theme_essential', 'ios', '', NULL),
(983, 2, 1435142718, 'theme_essential', 'iphoneicon', '', NULL),
(984, 2, 1435142718, 'theme_essential', 'iphoneretinaicon', '', NULL),
(985, 2, 1435142718, 'theme_essential', 'ipadicon', '', NULL),
(986, 2, 1435142718, 'theme_essential', 'ipadretinaicon', '', NULL),
(987, 2, 1435142718, 'theme_essential', 'fontselect', '1', NULL),
(988, 2, 1435142719, 'theme_essential', 'fontnameheading', 'Verdana', NULL),
(989, 2, 1435142719, 'theme_essential', 'fontnamebody', 'Verdana', NULL),
(990, 2, 1435142719, 'theme_essential', 'copyright', '', NULL),
(991, 2, 1435142719, 'theme_essential', 'footnote', '', NULL),
(992, 2, 1435142719, 'theme_essential', 'perfinfo', 'min', NULL),
(993, 2, 1435142720, 'theme_essential', 'courselistteachericon', 'graduation-cap', NULL),
(994, 2, 1435142720, 'theme_essential', 'togglefrontcontent', '0', NULL),
(995, 2, 1435142720, 'theme_essential', 'frontcontentarea', '', NULL),
(996, 2, 1435142720, 'theme_essential', 'frontpageblocks', '1', NULL),
(997, 2, 1435142720, 'theme_essential', 'frontpagemiddleblocks', '0', NULL),
(998, 2, 1435142721, 'theme_essential', 'togglemarketing', '1', NULL),
(999, 2, 1435142721, 'theme_essential', 'marketingheight', '100', NULL),
(1000, 2, 1435142721, 'theme_essential', 'marketing1', '', NULL),
(1001, 2, 1435142721, 'theme_essential', 'marketing1icon', 'star', NULL),
(1002, 2, 1435142721, 'theme_essential', 'marketing1image', '', NULL),
(1003, 2, 1435142722, 'theme_essential', 'marketing1content', '', NULL),
(1004, 2, 1435142722, 'theme_essential', 'marketing1buttontext', '', NULL),
(1005, 2, 1435142722, 'theme_essential', 'marketing1buttonurl', '', NULL),
(1006, 2, 1435142722, 'theme_essential', 'marketing1target', '_blank', NULL),
(1007, 2, 1435142722, 'theme_essential', 'marketing2', '', NULL),
(1008, 2, 1435142723, 'theme_essential', 'marketing2icon', 'star', NULL),
(1009, 2, 1435142723, 'theme_essential', 'marketing2image', '', NULL),
(1010, 2, 1435142723, 'theme_essential', 'marketing2content', '', NULL),
(1011, 2, 1435142723, 'theme_essential', 'marketing2buttontext', '', NULL),
(1012, 2, 1435142723, 'theme_essential', 'marketing2buttonurl', '', NULL),
(1013, 2, 1435142723, 'theme_essential', 'marketing2target', '_blank', NULL),
(1014, 2, 1435142724, 'theme_essential', 'marketing3', '', NULL),
(1015, 2, 1435142724, 'theme_essential', 'marketing3icon', 'star', NULL),
(1016, 2, 1435142724, 'theme_essential', 'marketing3image', '', NULL),
(1017, 2, 1435142724, 'theme_essential', 'marketing3content', '', NULL),
(1018, 2, 1435142725, 'theme_essential', 'marketing3buttontext', '', NULL),
(1019, 2, 1435142725, 'theme_essential', 'marketing3buttonurl', '', NULL),
(1020, 2, 1435142725, 'theme_essential', 'marketing3target', '_blank', NULL),
(1021, 2, 1435142726, 'theme_essential', 'enable1alert', '', NULL),
(1022, 2, 1435142726, 'theme_essential', 'alert1type', 'info', NULL),
(1023, 2, 1435142726, 'theme_essential', 'alert1title', '', NULL),
(1024, 2, 1435142726, 'theme_essential', 'alert1text', '', NULL),
(1025, 2, 1435142726, 'theme_essential', 'enable2alert', '', NULL),
(1026, 2, 1435142726, 'theme_essential', 'alert2type', 'info', NULL),
(1027, 2, 1435142727, 'theme_essential', 'alert2title', '', NULL),
(1028, 2, 1435142727, 'theme_essential', 'alert2text', '', NULL),
(1029, 2, 1435142727, 'theme_essential', 'enable3alert', '', NULL),
(1030, 2, 1435142727, 'theme_essential', 'alert3type', 'info', NULL),
(1031, 2, 1435142727, 'theme_essential', 'alert3title', '', NULL),
(1032, 2, 1435142728, 'theme_essential', 'alert3text', '', NULL),
(1033, 2, 1435142728, 'theme_essential', 'toggleslideshow', '1', NULL),
(1034, 2, 1435142728, 'theme_essential', 'numberofslides', '4', NULL),
(1035, 2, 1435142728, 'theme_essential', 'hideontablet', '', NULL),
(1036, 2, 1435142728, 'theme_essential', 'hideonphone', '1', NULL),
(1037, 2, 1435142728, 'theme_essential', 'slideinterval', '5000', NULL),
(1038, 2, 1435142729, 'theme_essential', 'slidecolor', '#ffffff', NULL),
(1039, 2, 1435142729, 'theme_essential', 'slidecaptionoptions', '0', NULL),
(1040, 2, 1435142730, 'theme_essential', 'slidecaptioncentred', '', NULL),
(1041, 2, 1435142730, 'theme_essential', 'slidebuttoncolor', '#30add1', NULL),
(1042, 2, 1435142730, 'theme_essential', 'slidebuttonhovercolor', '#217a94', NULL),
(1043, 2, 1435142730, 'theme_essential', 'enablecategoryicon', '1', NULL),
(1044, 2, 1435142731, 'theme_essential', 'analyticsenabled', '1', NULL),
(1045, 2, 1435142731, 'theme_essential', 'analytics', 'piwik', NULL),
(1046, 2, 1435142731, 'theme_essential', 'analyticstrackadmin', '', NULL),
(1047, 2, 1435142731, 'theme_essential', 'analyticscleanurl', '1', NULL),
(1048, 2, 1435142756, 'theme_essential', 'slide1', '', NULL),
(1049, 2, 1435142756, 'theme_essential', 'slide1image', '', NULL),
(1050, 2, 1435142756, 'theme_essential', 'slide1caption', '', NULL),
(1051, 2, 1435142756, 'theme_essential', 'slide1url', '', NULL),
(1052, 2, 1435142756, 'theme_essential', 'slide1target', '_blank', NULL),
(1053, 2, 1435142757, 'theme_essential', 'slide2', '', NULL),
(1054, 2, 1435142757, 'theme_essential', 'slide2image', '', NULL),
(1055, 2, 1435142757, 'theme_essential', 'slide2caption', '', NULL),
(1056, 2, 1435142757, 'theme_essential', 'slide2url', '', NULL),
(1057, 2, 1435142758, 'theme_essential', 'slide2target', '_blank', NULL),
(1058, 2, 1435142758, 'theme_essential', 'slide3', '', NULL),
(1059, 2, 1435142758, 'theme_essential', 'slide3image', '', NULL),
(1060, 2, 1435142758, 'theme_essential', 'slide3caption', '', NULL),
(1061, 2, 1435142758, 'theme_essential', 'slide3url', '', NULL),
(1062, 2, 1435142759, 'theme_essential', 'slide3target', '_blank', NULL),
(1063, 2, 1435142759, 'theme_essential', 'slide4', '', NULL),
(1064, 2, 1435142759, 'theme_essential', 'slide4image', '', NULL),
(1065, 2, 1435142759, 'theme_essential', 'slide4caption', '', NULL),
(1066, 2, 1435142759, 'theme_essential', 'slide4url', '', NULL),
(1067, 2, 1435142760, 'theme_essential', 'slide4target', '_blank', NULL),
(1068, 2, 1435142760, 'theme_essential', 'defaultcategoryicon', 'folder-open', NULL),
(1069, 2, 1435142760, 'theme_essential', 'enablecustomcategoryicon', '0', NULL),
(1070, 2, 1435142760, 'theme_essential', 'analyticssiteid', '1', NULL),
(1071, 2, 1435142760, 'theme_essential', 'analyticsimagetrack', '1', NULL),
(1072, 2, 1435142761, 'theme_essential', 'analyticssiteurl', '', NULL),
(1073, 2, 1436945746, 'slideshow', 'Max_Slides', '5', NULL),
(1074, 2, 1436945746, 'slideshow', 'Max_Size', '4194304', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_plugins`
--

CREATE TABLE IF NOT EXISTS `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Moodle modules and plugins configuration variables' AUTO_INCREMENT=1263 ;

--
-- Dumping data for table `mdl_config_plugins`
--

INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'moodlecourse', 'visible', '1'),
(2, 'moodlecourse', 'format', 'weeks'),
(3, 'moodlecourse', 'maxsections', '52'),
(4, 'moodlecourse', 'numsections', '10'),
(5, 'moodlecourse', 'hiddensections', '0'),
(6, 'moodlecourse', 'coursedisplay', '0'),
(7, 'moodlecourse', 'lang', ''),
(8, 'moodlecourse', 'newsitems', '5'),
(9, 'moodlecourse', 'showgrades', '1'),
(10, 'moodlecourse', 'showreports', '0'),
(11, 'moodlecourse', 'maxbytes', '0'),
(12, 'moodlecourse', 'enablecompletion', '0'),
(13, 'moodlecourse', 'groupmode', '0'),
(14, 'moodlecourse', 'groupmodeforce', '0'),
(15, 'backup', 'loglifetime', '30'),
(16, 'backup', 'backup_general_users', '1'),
(17, 'backup', 'backup_general_users_locked', ''),
(18, 'backup', 'backup_general_anonymize', '0'),
(19, 'backup', 'backup_general_anonymize_locked', ''),
(20, 'backup', 'backup_general_role_assignments', '1'),
(21, 'backup', 'backup_general_role_assignments_locked', ''),
(22, 'backup', 'backup_general_activities', '1'),
(23, 'backup', 'backup_general_activities_locked', ''),
(24, 'backup', 'backup_general_blocks', '1'),
(25, 'backup', 'backup_general_blocks_locked', ''),
(26, 'backup', 'backup_general_filters', '1'),
(27, 'backup', 'backup_general_filters_locked', ''),
(28, 'backup', 'backup_general_comments', '1'),
(29, 'backup', 'backup_general_comments_locked', ''),
(30, 'backup', 'backup_general_badges', '1'),
(31, 'backup', 'backup_general_badges_locked', ''),
(32, 'backup', 'backup_general_userscompletion', '1'),
(33, 'backup', 'backup_general_userscompletion_locked', ''),
(34, 'backup', 'backup_general_logs', '0'),
(35, 'backup', 'backup_general_logs_locked', ''),
(36, 'backup', 'backup_general_histories', '0'),
(37, 'backup', 'backup_general_histories_locked', ''),
(38, 'backup', 'backup_general_questionbank', '1'),
(39, 'backup', 'backup_general_questionbank_locked', ''),
(40, 'backup', 'backup_general_groups', '1'),
(41, 'backup', 'backup_general_groups_locked', ''),
(42, 'backup', 'import_general_maxresults', '10'),
(43, 'backup', 'backup_auto_active', '0'),
(44, 'backup', 'backup_auto_weekdays', '0000000'),
(45, 'backup', 'backup_auto_hour', '0'),
(46, 'backup', 'backup_auto_minute', '0'),
(47, 'backup', 'backup_auto_storage', '0'),
(48, 'backup', 'backup_auto_destination', ''),
(49, 'backup', 'backup_auto_keep', '1'),
(50, 'backup', 'backup_shortname', '0'),
(51, 'backup', 'backup_auto_skip_hidden', '1'),
(52, 'backup', 'backup_auto_skip_modif_days', '30'),
(53, 'backup', 'backup_auto_skip_modif_prev', '0'),
(54, 'backup', 'backup_auto_users', '1'),
(55, 'backup', 'backup_auto_role_assignments', '1'),
(56, 'backup', 'backup_auto_activities', '1'),
(57, 'backup', 'backup_auto_blocks', '1'),
(58, 'backup', 'backup_auto_filters', '1'),
(59, 'backup', 'backup_auto_comments', '1'),
(60, 'backup', 'backup_auto_badges', '1'),
(61, 'backup', 'backup_auto_userscompletion', '1'),
(62, 'backup', 'backup_auto_logs', '0'),
(63, 'backup', 'backup_auto_histories', '0'),
(64, 'backup', 'backup_auto_questionbank', '1'),
(65, 'backup', 'backup_auto_groups', '1'),
(66, 'cachestore_memcache', 'testservers', ''),
(67, 'cachestore_memcached', 'testservers', ''),
(68, 'cachestore_mongodb', 'testserver', ''),
(69, 'question_preview', 'behaviour', 'deferredfeedback'),
(70, 'question_preview', 'correctness', '1'),
(71, 'question_preview', 'marks', '2'),
(72, 'question_preview', 'markdp', '2'),
(73, 'question_preview', 'feedback', '1'),
(74, 'question_preview', 'generalfeedback', '1'),
(75, 'question_preview', 'rightanswer', '1'),
(76, 'question_preview', 'history', '0'),
(77, 'theme_clean', 'invert', '0'),
(78, 'theme_clean', 'logo', ''),
(79, 'theme_clean', 'customcss', ''),
(80, 'theme_clean', 'footnote', ''),
(81, 'theme_more', 'textcolor', '#333366'),
(82, 'theme_more', 'linkcolor', '#FF6500'),
(83, 'theme_more', 'bodybackground', ''),
(84, 'theme_more', 'backgroundimage', ''),
(85, 'theme_more', 'backgroundrepeat', 'repeat'),
(86, 'theme_more', 'backgroundposition', '0'),
(87, 'theme_more', 'backgroundfixed', '0'),
(88, 'theme_more', 'contentbackground', '#FFFFFF'),
(89, 'theme_more', 'secondarybackground', '#FFFFFF'),
(90, 'theme_more', 'invert', '1'),
(91, 'theme_more', 'logo', ''),
(92, 'theme_more', 'customcss', ''),
(93, 'theme_more', 'footnote', ''),
(94, 'availability_completion', 'version', '2015051100'),
(95, 'availability_date', 'version', '2015051100'),
(96, 'availability_grade', 'version', '2015051100'),
(97, 'availability_group', 'version', '2015051100'),
(98, 'availability_grouping', 'version', '2015051100'),
(99, 'availability_profile', 'version', '2015051100'),
(100, 'qtype_calculated', 'version', '2015051100'),
(101, 'qtype_calculatedmulti', 'version', '2015051100'),
(102, 'qtype_calculatedsimple', 'version', '2015051100'),
(103, 'qtype_description', 'version', '2015051100'),
(104, 'qtype_essay', 'version', '2015051100'),
(105, 'qtype_match', 'version', '2015051100'),
(106, 'qtype_missingtype', 'version', '2015051100'),
(107, 'qtype_multianswer', 'version', '2015051100'),
(108, 'qtype_multichoice', 'version', '2015051100'),
(109, 'qtype_numerical', 'version', '2015051100'),
(110, 'qtype_random', 'version', '2015051100'),
(111, 'qtype_randomsamatch', 'version', '2015051100'),
(112, 'qtype_shortanswer', 'version', '2015051100'),
(113, 'qtype_truefalse', 'version', '2015051100'),
(114, 'mod_assign', 'version', '2015051100'),
(115, 'mod_assignment', 'version', '2015051100'),
(117, 'mod_book', 'version', '2015051100'),
(118, 'mod_chat', 'version', '2015051100'),
(119, 'mod_choice', 'version', '2015051100'),
(120, 'mod_data', 'version', '2015051100'),
(121, 'mod_feedback', 'version', '2015051100'),
(123, 'mod_folder', 'version', '2015051100'),
(125, 'mod_forum', 'version', '2015051101'),
(126, 'mod_glossary', 'version', '2015051100'),
(127, 'mod_imscp', 'version', '2015051100'),
(129, 'mod_label', 'version', '2015051100'),
(130, 'mod_lesson', 'version', '2015051100'),
(131, 'mod_lti', 'version', '2015051100'),
(132, 'mod_page', 'version', '2015051100'),
(134, 'mod_quiz', 'version', '2015051100'),
(135, 'mod_resource', 'version', '2015051100'),
(136, 'mod_scorm', 'version', '2015051101'),
(137, 'mod_survey', 'version', '2015051100'),
(139, 'mod_url', 'version', '2015051100'),
(141, 'mod_wiki', 'version', '2015051100'),
(143, 'mod_workshop', 'version', '2015051100'),
(144, 'auth_cas', 'version', '2015051100'),
(146, 'auth_db', 'version', '2015051100'),
(148, 'auth_email', 'version', '2015051100'),
(149, 'auth_fc', 'version', '2015051100'),
(151, 'auth_imap', 'version', '2015051100'),
(153, 'auth_ldap', 'version', '2015051100'),
(155, 'auth_manual', 'version', '2015051100'),
(156, 'auth_mnet', 'version', '2015051100'),
(158, 'auth_nntp', 'version', '2015051100'),
(160, 'auth_nologin', 'version', '2015051100'),
(161, 'auth_none', 'version', '2015051100'),
(162, 'auth_pam', 'version', '2015051100'),
(164, 'auth_pop3', 'version', '2015051100'),
(166, 'auth_radius', 'version', '2015051100'),
(168, 'auth_shibboleth', 'version', '2015051100'),
(170, 'auth_webservice', 'version', '2015051100'),
(171, 'calendartype_gregorian', 'version', '2015051100'),
(172, 'enrol_category', 'version', '2015051100'),
(174, 'enrol_cohort', 'version', '2015051100'),
(175, 'enrol_database', 'version', '2015051100'),
(177, 'enrol_flatfile', 'version', '2015051100'),
(179, 'enrol_flatfile', 'map_1', 'manager'),
(180, 'enrol_flatfile', 'map_2', 'coursecreator'),
(181, 'enrol_flatfile', 'map_3', 'editingteacher'),
(182, 'enrol_flatfile', 'map_4', 'teacher'),
(183, 'enrol_flatfile', 'map_5', 'student'),
(184, 'enrol_flatfile', 'map_6', 'guest'),
(185, 'enrol_flatfile', 'map_7', 'user'),
(186, 'enrol_flatfile', 'map_8', 'frontpage'),
(187, 'enrol_guest', 'version', '2015051100'),
(188, 'enrol_imsenterprise', 'version', '2015051100'),
(190, 'enrol_ldap', 'version', '2015051100'),
(192, 'enrol_manual', 'version', '2015051100'),
(194, 'enrol_meta', 'version', '2015051100'),
(196, 'enrol_mnet', 'version', '2015051100'),
(197, 'enrol_paypal', 'version', '2015051100'),
(198, 'enrol_self', 'version', '2015051100'),
(200, 'message_airnotifier', 'version', '2015051100'),
(202, 'message', 'airnotifier_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(203, 'message', 'airnotifier_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(204, 'message', 'airnotifier_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(205, 'message', 'airnotifier_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(206, 'message', 'airnotifier_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(207, 'message', 'airnotifier_provider_mod_assign_assign_notification_permitted', 'permitted'),
(208, 'message', 'airnotifier_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(209, 'message', 'airnotifier_provider_mod_feedback_submission_permitted', 'permitted'),
(210, 'message', 'airnotifier_provider_mod_feedback_message_permitted', 'permitted'),
(211, 'message', 'airnotifier_provider_mod_forum_posts_permitted', 'permitted'),
(212, 'message', 'airnotifier_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(213, 'message', 'airnotifier_provider_mod_quiz_submission_permitted', 'permitted'),
(214, 'message', 'airnotifier_provider_mod_quiz_confirmation_permitted', 'permitted'),
(215, 'message', 'airnotifier_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(216, 'message', 'airnotifier_provider_moodle_notices_permitted', 'permitted'),
(217, 'message', 'airnotifier_provider_moodle_errors_permitted', 'permitted'),
(218, 'message', 'airnotifier_provider_moodle_availableupdate_permitted', 'permitted'),
(219, 'message', 'airnotifier_provider_moodle_instantmessage_permitted', 'permitted'),
(220, 'message', 'airnotifier_provider_moodle_backup_permitted', 'permitted'),
(221, 'message', 'airnotifier_provider_moodle_courserequested_permitted', 'permitted'),
(222, 'message', 'airnotifier_provider_moodle_courserequestapproved_permitted', 'permitted'),
(223, 'message', 'airnotifier_provider_moodle_courserequestrejected_permitted', 'permitted'),
(224, 'message', 'airnotifier_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(225, 'message', 'airnotifier_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(226, 'message_email', 'version', '2015051100'),
(228, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(229, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
(230, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
(231, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(232, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
(233, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
(234, 'message', 'email_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(235, 'message', 'message_provider_enrol_manual_expiry_notification_loggedin', 'email'),
(236, 'message', 'message_provider_enrol_manual_expiry_notification_loggedoff', 'email'),
(237, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(238, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
(239, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
(240, 'message', 'email_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(241, 'message', 'message_provider_enrol_self_expiry_notification_loggedin', 'email'),
(242, 'message', 'message_provider_enrol_self_expiry_notification_loggedoff', 'email'),
(243, 'message', 'email_provider_mod_assign_assign_notification_permitted', 'permitted'),
(244, 'message', 'message_provider_mod_assign_assign_notification_loggedin', 'email'),
(245, 'message', 'message_provider_mod_assign_assign_notification_loggedoff', 'email'),
(246, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(247, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(248, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(249, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(250, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(251, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(252, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(253, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(254, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(255, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(256, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(257, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(258, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(259, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(260, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(261, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(262, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(263, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(264, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(265, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(266, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(267, 'message', 'email_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(268, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedin', 'email'),
(269, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedoff', 'email'),
(270, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(271, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(272, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(273, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(274, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(275, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(276, 'message', 'email_provider_moodle_availableupdate_permitted', 'permitted'),
(277, 'message', 'message_provider_moodle_availableupdate_loggedin', 'email'),
(278, 'message', 'message_provider_moodle_availableupdate_loggedoff', 'email'),
(279, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(280, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(281, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(282, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(283, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(284, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(285, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(286, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(287, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(288, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(289, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(290, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(291, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(292, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(293, 'message', 'email_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(294, 'message', 'message_provider_moodle_badgerecipientnotice_loggedoff', 'popup,email'),
(295, 'message', 'email_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(296, 'message', 'message_provider_moodle_badgecreatornotice_loggedoff', 'email'),
(297, 'message_jabber', 'version', '2015051100'),
(299, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(300, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(301, 'message', 'jabber_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(302, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(303, 'message', 'jabber_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(304, 'message', 'jabber_provider_mod_assign_assign_notification_permitted', 'permitted'),
(305, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(306, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(307, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(308, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(309, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(310, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(311, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(312, 'message', 'jabber_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(313, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(314, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(315, 'message', 'jabber_provider_moodle_availableupdate_permitted', 'permitted'),
(316, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(317, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(318, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(319, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(320, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(321, 'message', 'jabber_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(322, 'message', 'jabber_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(323, 'message_popup', 'version', '2015051100'),
(325, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(326, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(327, 'message', 'popup_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(328, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(329, 'message', 'popup_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(330, 'message', 'popup_provider_mod_assign_assign_notification_permitted', 'permitted'),
(331, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(332, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(333, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(334, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(335, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(336, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(337, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(338, 'message', 'popup_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(339, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(340, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(341, 'message', 'popup_provider_moodle_availableupdate_permitted', 'permitted'),
(342, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(343, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(344, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(345, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(346, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(347, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(348, 'message', 'popup_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(349, 'message', 'message_provider_moodle_badgerecipientnotice_loggedin', 'popup'),
(350, 'message', 'popup_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(351, 'block_activity_modules', 'version', '2015051100'),
(352, 'block_activity_results', 'version', '2015051100'),
(353, 'block_admin_bookmarks', 'version', '2015051100'),
(354, 'block_badges', 'version', '2015051100'),
(355, 'block_blog_menu', 'version', '2015051100'),
(356, 'block_blog_recent', 'version', '2015051100'),
(357, 'block_blog_tags', 'version', '2015051100'),
(358, 'block_calendar_month', 'version', '2015051100'),
(359, 'block_calendar_upcoming', 'version', '2015051100'),
(360, 'block_comments', 'version', '2015051100'),
(361, 'block_community', 'version', '2015051100'),
(362, 'block_completionstatus', 'version', '2015051100'),
(363, 'block_course_list', 'version', '2015051100'),
(364, 'block_course_overview', 'version', '2015051100'),
(365, 'block_course_summary', 'version', '2015051100'),
(366, 'block_feedback', 'version', '2015051100'),
(368, 'block_glossary_random', 'version', '2015051100'),
(369, 'block_html', 'version', '2015051100'),
(370, 'block_login', 'version', '2015051100'),
(371, 'block_mentees', 'version', '2015051100'),
(372, 'block_messages', 'version', '2015051100'),
(373, 'block_mnet_hosts', 'version', '2015051100'),
(374, 'block_myprofile', 'version', '2015051100'),
(375, 'block_navigation', 'version', '2015051100'),
(376, 'block_news_items', 'version', '2015051100'),
(377, 'block_online_users', 'version', '2015051100'),
(378, 'block_participants', 'version', '2015051100'),
(379, 'block_private_files', 'version', '2015051100'),
(380, 'block_quiz_results', 'version', '2015051100'),
(382, 'block_recent_activity', 'version', '2015051100'),
(383, 'block_rss_client', 'version', '2015051100'),
(384, 'block_search_forums', 'version', '2015051100'),
(385, 'block_section_links', 'version', '2015051100'),
(386, 'block_selfcompletion', 'version', '2015051100'),
(387, 'block_settings', 'version', '2015051100'),
(388, 'block_site_main_menu', 'version', '2015051100'),
(389, 'block_social_activities', 'version', '2015051100'),
(390, 'block_tag_flickr', 'version', '2015051100'),
(391, 'block_tag_youtube', 'version', '2015051100'),
(392, 'block_tags', 'version', '2015051100'),
(393, 'filter_activitynames', 'version', '2015051100'),
(395, 'filter_algebra', 'version', '2015051100'),
(396, 'filter_censor', 'version', '2015051100'),
(397, 'filter_data', 'version', '2015051100'),
(399, 'filter_emailprotect', 'version', '2015051100'),
(400, 'filter_emoticon', 'version', '2015051100'),
(401, 'filter_glossary', 'version', '2015051100'),
(403, 'filter_mathjaxloader', 'version', '2015051100'),
(405, 'filter_mediaplugin', 'version', '2015051100'),
(407, 'filter_multilang', 'version', '2015051100'),
(408, 'filter_tex', 'version', '2015051100'),
(410, 'filter_tidy', 'version', '2015051100'),
(411, 'filter_urltolink', 'version', '2015051100'),
(412, 'editor_atto', 'version', '2015051100'),
(414, 'editor_textarea', 'version', '2015051100'),
(415, 'editor_tinymce', 'version', '2015051100'),
(416, 'format_singleactivity', 'version', '2015051100'),
(417, 'format_social', 'version', '2015102100'),
(418, 'format_topics', 'version', '2015051100'),
(419, 'format_weeks', 'version', '2015051100'),
(420, 'profilefield_checkbox', 'version', '2015051100'),
(421, 'profilefield_datetime', 'version', '2015051100'),
(422, 'profilefield_menu', 'version', '2015051100'),
(423, 'profilefield_text', 'version', '2015051100'),
(424, 'profilefield_textarea', 'version', '2015051100'),
(425, 'report_backups', 'version', '2015051100'),
(426, 'report_completion', 'version', '2015051100'),
(428, 'report_configlog', 'version', '2015051100'),
(429, 'report_courseoverview', 'version', '2015051100'),
(430, 'report_eventlist', 'version', '2015051100'),
(431, 'report_log', 'version', '2015051100'),
(433, 'report_loglive', 'version', '2015051100'),
(434, 'report_outline', 'version', '2015051100'),
(436, 'report_participation', 'version', '2015051100'),
(438, 'report_performance', 'version', '2015051100'),
(439, 'report_progress', 'version', '2015051100'),
(441, 'report_questioninstances', 'version', '2015051100'),
(442, 'report_security', 'version', '2015051100'),
(443, 'report_stats', 'version', '2015051100'),
(445, 'report_usersessions', 'version', '2015051100'),
(446, 'gradeexport_ods', 'version', '2015051100'),
(447, 'gradeexport_txt', 'version', '2015051100'),
(448, 'gradeexport_xls', 'version', '2015051100'),
(449, 'gradeexport_xml', 'version', '2015051100'),
(450, 'gradeimport_csv', 'version', '2015051100'),
(451, 'gradeimport_direct', 'version', '2015051100'),
(452, 'gradeimport_xml', 'version', '2015051100'),
(453, 'gradereport_grader', 'version', '2015051100'),
(454, 'gradereport_history', 'version', '2015051100'),
(455, 'gradereport_outcomes', 'version', '2015051100'),
(456, 'gradereport_overview', 'version', '2015051100'),
(457, 'gradereport_singleview', 'version', '2015051100'),
(458, 'gradereport_user', 'version', '2015051100'),
(459, 'gradingform_guide', 'version', '2015051100'),
(460, 'gradingform_rubric', 'version', '2015051100'),
(461, 'mnetservice_enrol', 'version', '2015051100'),
(462, 'webservice_amf', 'version', '2015051100'),
(463, 'webservice_rest', 'version', '2015051100'),
(464, 'webservice_soap', 'version', '2015051100'),
(465, 'webservice_xmlrpc', 'version', '2015051100'),
(466, 'repository_alfresco', 'version', '2015051100'),
(467, 'repository_areafiles', 'version', '2015051100'),
(469, 'areafiles', 'enablecourseinstances', '0'),
(470, 'areafiles', 'enableuserinstances', '0'),
(471, 'repository_boxnet', 'version', '2015051100'),
(472, 'repository_coursefiles', 'version', '2015051100'),
(473, 'repository_dropbox', 'version', '2015051100'),
(474, 'repository_equella', 'version', '2015051100'),
(475, 'repository_filesystem', 'version', '2015051100'),
(476, 'repository_flickr', 'version', '2015051100'),
(477, 'repository_flickr_public', 'version', '2015051100'),
(478, 'repository_googledocs', 'version', '2015051100'),
(479, 'repository_local', 'version', '2015051100'),
(481, 'local', 'enablecourseinstances', '0'),
(482, 'local', 'enableuserinstances', '0'),
(483, 'repository_merlot', 'version', '2015051100'),
(484, 'repository_picasa', 'version', '2015051100'),
(485, 'repository_recent', 'version', '2015051100'),
(487, 'recent', 'enablecourseinstances', '0'),
(488, 'recent', 'enableuserinstances', '0'),
(489, 'repository_s3', 'version', '2015051100'),
(490, 'repository_skydrive', 'version', '2015051100'),
(491, 'repository_upload', 'version', '2015051100'),
(493, 'upload', 'enablecourseinstances', '0'),
(494, 'upload', 'enableuserinstances', '0'),
(495, 'repository_url', 'version', '2015051100'),
(497, 'url', 'enablecourseinstances', '0'),
(498, 'url', 'enableuserinstances', '0'),
(499, 'repository_user', 'version', '2015051100'),
(501, 'user', 'enablecourseinstances', '0'),
(502, 'user', 'enableuserinstances', '0'),
(503, 'repository_webdav', 'version', '2015051100'),
(504, 'repository_wikimedia', 'version', '2015051100'),
(506, 'wikimedia', 'enablecourseinstances', '0'),
(507, 'wikimedia', 'enableuserinstances', '0'),
(508, 'repository_youtube', 'version', '2015051101'),
(510, 'youtube', 'enablecourseinstances', '0'),
(511, 'youtube', 'enableuserinstances', '0'),
(512, 'portfolio_boxnet', 'version', '2015051100'),
(513, 'portfolio_download', 'version', '2015051100'),
(514, 'portfolio_flickr', 'version', '2015051100'),
(515, 'portfolio_googledocs', 'version', '2015051100'),
(516, 'portfolio_mahara', 'version', '2015051100'),
(517, 'portfolio_picasa', 'version', '2015051100'),
(518, 'qbehaviour_adaptive', 'version', '2015051100'),
(519, 'qbehaviour_adaptivenopenalty', 'version', '2015051100'),
(520, 'qbehaviour_deferredcbm', 'version', '2015051100'),
(521, 'qbehaviour_deferredfeedback', 'version', '2015051100'),
(522, 'qbehaviour_immediatecbm', 'version', '2015051100'),
(523, 'qbehaviour_immediatefeedback', 'version', '2015051100'),
(524, 'qbehaviour_informationitem', 'version', '2015051100'),
(525, 'qbehaviour_interactive', 'version', '2015051100'),
(526, 'qbehaviour_interactivecountback', 'version', '2015051100'),
(527, 'qbehaviour_manualgraded', 'version', '2015051100'),
(529, 'question', 'disabledbehaviours', 'manualgraded'),
(530, 'qbehaviour_missing', 'version', '2015051100'),
(531, 'qformat_aiken', 'version', '2015051100'),
(532, 'qformat_blackboard_six', 'version', '2015051100'),
(533, 'qformat_examview', 'version', '2015051100'),
(534, 'qformat_gift', 'version', '2015051100'),
(535, 'qformat_missingword', 'version', '2015051100'),
(536, 'qformat_multianswer', 'version', '2015051100'),
(537, 'qformat_webct', 'version', '2015051100'),
(538, 'qformat_xhtml', 'version', '2015051100'),
(539, 'qformat_xml', 'version', '2015051100'),
(540, 'tool_assignmentupgrade', 'version', '2015051100'),
(541, 'tool_availabilityconditions', 'version', '2015051100'),
(542, 'tool_behat', 'version', '2015051100'),
(543, 'tool_capability', 'version', '2015051100'),
(544, 'tool_customlang', 'version', '2015051100'),
(546, 'tool_dbtransfer', 'version', '2015051100'),
(547, 'tool_filetypes', 'version', '2015051100'),
(548, 'tool_generator', 'version', '2015051100'),
(549, 'tool_health', 'version', '2015051100'),
(550, 'tool_innodb', 'version', '2015051100'),
(551, 'tool_installaddon', 'version', '2015051100'),
(552, 'tool_langimport', 'version', '2015051100'),
(553, 'tool_log', 'version', '2015051100'),
(555, 'tool_log', 'enabled_stores', 'logstore_standard'),
(556, 'tool_messageinbound', 'version', '2015051100'),
(557, 'message', 'airnotifier_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(558, 'message', 'email_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(559, 'message', 'jabber_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(560, 'message', 'popup_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(561, 'message', 'message_provider_tool_messageinbound_invalidrecipienthandler_loggedin', 'email'),
(562, 'message', 'message_provider_tool_messageinbound_invalidrecipienthandler_loggedoff', 'email'),
(563, 'message', 'airnotifier_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(564, 'message', 'email_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(565, 'message', 'jabber_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(566, 'message', 'popup_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(567, 'message', 'message_provider_tool_messageinbound_messageprocessingerror_loggedin', 'email'),
(568, 'message', 'message_provider_tool_messageinbound_messageprocessingerror_loggedoff', 'email'),
(569, 'message', 'airnotifier_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(570, 'message', 'email_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(571, 'message', 'jabber_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(572, 'message', 'popup_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(573, 'message', 'message_provider_tool_messageinbound_messageprocessingsuccess_loggedin', 'email'),
(574, 'message', 'message_provider_tool_messageinbound_messageprocessingsuccess_loggedoff', 'email'),
(575, 'tool_monitor', 'version', '2015051100'),
(576, 'message', 'airnotifier_provider_tool_monitor_notification_permitted', 'permitted'),
(577, 'message', 'email_provider_tool_monitor_notification_permitted', 'permitted'),
(578, 'message', 'jabber_provider_tool_monitor_notification_permitted', 'permitted'),
(579, 'message', 'popup_provider_tool_monitor_notification_permitted', 'permitted'),
(580, 'message', 'message_provider_tool_monitor_notification_loggedin', 'email'),
(581, 'message', 'message_provider_tool_monitor_notification_loggedoff', 'email'),
(582, 'tool_multilangupgrade', 'version', '2015051100'),
(583, 'tool_phpunit', 'version', '2015051100'),
(584, 'tool_profiling', 'version', '2015051100'),
(585, 'tool_replace', 'version', '2015051100'),
(586, 'tool_spamcleaner', 'version', '2015051100'),
(587, 'tool_task', 'version', '2015051100'),
(588, 'tool_templatelibrary', 'version', '2015051100'),
(589, 'tool_unsuproles', 'version', '2015051100'),
(591, 'tool_uploadcourse', 'version', '2015051100'),
(592, 'tool_uploaduser', 'version', '2015051100'),
(593, 'tool_xmldb', 'version', '2015051100'),
(594, 'cachestore_file', 'version', '2015051100'),
(595, 'cachestore_memcache', 'version', '2015051100'),
(596, 'cachestore_memcached', 'version', '2015051100'),
(597, 'cachestore_mongodb', 'version', '2015051100'),
(598, 'cachestore_session', 'version', '2015051100'),
(599, 'cachestore_static', 'version', '2015051100'),
(600, 'cachelock_file', 'version', '2015051100'),
(601, 'theme_base', 'version', '2015051100'),
(602, 'theme_bootstrapbase', 'version', '2015051100'),
(603, 'theme_canvas', 'version', '2015051100'),
(604, 'theme_clean', 'version', '2015051100'),
(605, 'theme_more', 'version', '2015051100'),
(607, 'assignsubmission_comments', 'version', '2015051100'),
(609, 'assignsubmission_file', 'sortorder', '1'),
(610, 'assignsubmission_comments', 'sortorder', '2'),
(611, 'assignsubmission_onlinetext', 'sortorder', '0'),
(612, 'assignsubmission_file', 'version', '2015051100'),
(613, 'assignsubmission_onlinetext', 'version', '2015051100'),
(615, 'assignfeedback_comments', 'version', '2015051100'),
(617, 'assignfeedback_comments', 'sortorder', '0'),
(618, 'assignfeedback_editpdf', 'sortorder', '1'),
(619, 'assignfeedback_file', 'sortorder', '3'),
(620, 'assignfeedback_offline', 'sortorder', '2'),
(621, 'assignfeedback_editpdf', 'version', '2015051100'),
(623, 'assignfeedback_file', 'version', '2015051100'),
(625, 'assignfeedback_offline', 'version', '2015051100'),
(626, 'assignment_offline', 'version', '2015051100'),
(627, 'assignment_online', 'version', '2015051100'),
(628, 'assignment_upload', 'version', '2015051100'),
(629, 'assignment_uploadsingle', 'version', '2015051100'),
(630, 'booktool_exportimscp', 'version', '2015051100'),
(631, 'booktool_importhtml', 'version', '2015051100'),
(632, 'booktool_print', 'version', '2015051100'),
(633, 'datafield_checkbox', 'version', '2015051100'),
(634, 'datafield_date', 'version', '2015051100'),
(635, 'datafield_file', 'version', '2015051100'),
(636, 'datafield_latlong', 'version', '2015051100'),
(637, 'datafield_menu', 'version', '2015051100'),
(638, 'datafield_multimenu', 'version', '2015051100'),
(639, 'datafield_number', 'version', '2015051100'),
(640, 'datafield_picture', 'version', '2015051100'),
(641, 'datafield_radiobutton', 'version', '2015051100'),
(642, 'datafield_text', 'version', '2015051100'),
(643, 'datafield_textarea', 'version', '2015051100'),
(644, 'datafield_url', 'version', '2015051100'),
(645, 'datapreset_imagegallery', 'version', '2015051100'),
(646, 'ltiservice_profile', 'version', '2015051100'),
(647, 'ltiservice_toolproxy', 'version', '2015051100'),
(648, 'ltiservice_toolsettings', 'version', '2015051100'),
(649, 'quiz_grading', 'version', '2015051100'),
(651, 'quiz_overview', 'version', '2015051100'),
(653, 'quiz_responses', 'version', '2015051100'),
(655, 'quiz_statistics', 'version', '2015051100'),
(657, 'quizaccess_delaybetweenattempts', 'version', '2015051100'),
(658, 'quizaccess_ipaddress', 'version', '2015051100'),
(659, 'quizaccess_numattempts', 'version', '2015051100'),
(660, 'quizaccess_openclosedate', 'version', '2015051100'),
(661, 'quizaccess_password', 'version', '2015051100'),
(662, 'quizaccess_safebrowser', 'version', '2015051100'),
(663, 'quizaccess_securewindow', 'version', '2015051100'),
(664, 'quizaccess_timelimit', 'version', '2015051100'),
(665, 'scormreport_basic', 'version', '2015051100'),
(666, 'scormreport_graphs', 'version', '2015051100'),
(667, 'scormreport_interactions', 'version', '2015051100'),
(668, 'scormreport_objectives', 'version', '2015051100'),
(669, 'workshopform_accumulative', 'version', '2015051100'),
(671, 'workshopform_comments', 'version', '2015051100'),
(673, 'workshopform_numerrors', 'version', '2015051100'),
(675, 'workshopform_rubric', 'version', '2015051100'),
(677, 'workshopallocation_manual', 'version', '2015051100'),
(678, 'workshopallocation_random', 'version', '2015051100'),
(679, 'workshopallocation_scheduled', 'version', '2015051100'),
(680, 'workshopeval_best', 'version', '2015051100'),
(681, 'atto_accessibilitychecker', 'version', '2015051100'),
(682, 'atto_accessibilityhelper', 'version', '2015051100'),
(683, 'atto_align', 'version', '2015051100'),
(684, 'atto_backcolor', 'version', '2015051100'),
(685, 'atto_bold', 'version', '2015051100'),
(686, 'atto_charmap', 'version', '2015051100'),
(687, 'atto_clear', 'version', '2015051100'),
(688, 'atto_collapse', 'version', '2015051100'),
(689, 'atto_emoticon', 'version', '2015051100'),
(690, 'atto_equation', 'version', '2015051100'),
(691, 'atto_fontcolor', 'version', '2015051100'),
(692, 'atto_html', 'version', '2015051100'),
(693, 'atto_image', 'version', '2015051100'),
(694, 'atto_indent', 'version', '2015051100'),
(695, 'atto_italic', 'version', '2015051100'),
(696, 'atto_link', 'version', '2015051100'),
(697, 'atto_managefiles', 'version', '2015051100'),
(698, 'atto_media', 'version', '2015051100'),
(699, 'atto_noautolink', 'version', '2015051100'),
(700, 'atto_orderedlist', 'version', '2015051100'),
(701, 'atto_rtl', 'version', '2015051100'),
(702, 'atto_strike', 'version', '2015051100'),
(703, 'atto_subscript', 'version', '2015051100'),
(704, 'atto_superscript', 'version', '2015051100'),
(705, 'atto_table', 'version', '2015051100'),
(706, 'atto_title', 'version', '2015051100'),
(707, 'atto_underline', 'version', '2015051100'),
(708, 'atto_undo', 'version', '2015051100'),
(709, 'atto_unorderedlist', 'version', '2015051100'),
(710, 'tinymce_ctrlhelp', 'version', '2015051100'),
(711, 'tinymce_managefiles', 'version', '2015051100'),
(712, 'tinymce_moodleemoticon', 'version', '2015051100'),
(713, 'tinymce_moodleimage', 'version', '2015051100'),
(714, 'tinymce_moodlemedia', 'version', '2015051100'),
(715, 'tinymce_moodlenolink', 'version', '2015051100'),
(716, 'tinymce_pdw', 'version', '2015051100'),
(717, 'tinymce_spellchecker', 'version', '2015051100'),
(719, 'tinymce_wrap', 'version', '2015051100'),
(720, 'logstore_database', 'version', '2015051100'),
(721, 'logstore_legacy', 'version', '2015051100'),
(722, 'logstore_standard', 'version', '2015051100'),
(723, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments'),
(724, 'assign', 'showrecentsubmissions', '0'),
(725, 'assign', 'submissionreceipts', '1'),
(726, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.'),
(727, 'assign', 'alwaysshowdescription', '1'),
(728, 'assign', 'alwaysshowdescription_adv', ''),
(729, 'assign', 'alwaysshowdescription_locked', ''),
(730, 'assign', 'allowsubmissionsfromdate', '0'),
(731, 'assign', 'allowsubmissionsfromdate_enabled', '1'),
(732, 'assign', 'allowsubmissionsfromdate_adv', ''),
(733, 'assign', 'duedate', '604800'),
(734, 'assign', 'duedate_enabled', '1'),
(735, 'assign', 'duedate_adv', ''),
(736, 'assign', 'cutoffdate', '1209600'),
(737, 'assign', 'cutoffdate_enabled', ''),
(738, 'assign', 'cutoffdate_adv', ''),
(739, 'assign', 'submissiondrafts', '0'),
(740, 'assign', 'submissiondrafts_adv', ''),
(741, 'assign', 'submissiondrafts_locked', ''),
(742, 'assign', 'requiresubmissionstatement', '0'),
(743, 'assign', 'requiresubmissionstatement_adv', ''),
(744, 'assign', 'requiresubmissionstatement_locked', ''),
(745, 'assign', 'attemptreopenmethod', 'none'),
(746, 'assign', 'attemptreopenmethod_adv', ''),
(747, 'assign', 'attemptreopenmethod_locked', ''),
(748, 'assign', 'maxattempts', '-1'),
(749, 'assign', 'maxattempts_adv', ''),
(750, 'assign', 'maxattempts_locked', ''),
(751, 'assign', 'teamsubmission', '0'),
(752, 'assign', 'teamsubmission_adv', ''),
(753, 'assign', 'teamsubmission_locked', ''),
(754, 'assign', 'requireallteammemberssubmit', '0'),
(755, 'assign', 'requireallteammemberssubmit_adv', ''),
(756, 'assign', 'requireallteammemberssubmit_locked', ''),
(757, 'assign', 'teamsubmissiongroupingid', ''),
(758, 'assign', 'teamsubmissiongroupingid_adv', ''),
(759, 'assign', 'sendnotifications', '0'),
(760, 'assign', 'sendnotifications_adv', ''),
(761, 'assign', 'sendnotifications_locked', ''),
(762, 'assign', 'sendlatenotifications', '0'),
(763, 'assign', 'sendlatenotifications_adv', ''),
(764, 'assign', 'sendlatenotifications_locked', ''),
(765, 'assign', 'sendstudentnotifications', '1'),
(766, 'assign', 'sendstudentnotifications_adv', ''),
(767, 'assign', 'sendstudentnotifications_locked', ''),
(768, 'assign', 'blindmarking', '0'),
(769, 'assign', 'blindmarking_adv', ''),
(770, 'assign', 'blindmarking_locked', ''),
(771, 'assign', 'markingworkflow', '0'),
(772, 'assign', 'markingworkflow_adv', ''),
(773, 'assign', 'markingworkflow_locked', ''),
(774, 'assign', 'markingallocation', '0'),
(775, 'assign', 'markingallocation_adv', ''),
(776, 'assign', 'markingallocation_locked', ''),
(777, 'assign', 'preventsubmissionnotingroup', '0'),
(778, 'assign', 'preventsubmissionnotingroup_adv', ''),
(779, 'assign', 'preventsubmissionnotingroup_locked', ''),
(780, 'assignsubmission_file', 'default', '1'),
(781, 'assignsubmission_file', 'maxfiles', '20'),
(782, 'assignsubmission_file', 'maxbytes', '1048576'),
(783, 'assignsubmission_onlinetext', 'default', '0'),
(784, 'assignfeedback_comments', 'default', '1'),
(785, 'assignfeedback_comments', 'inline', '0'),
(786, 'assignfeedback_comments', 'inline_adv', ''),
(787, 'assignfeedback_comments', 'inline_locked', ''),
(788, 'assignfeedback_editpdf', 'stamps', ''),
(789, 'assignfeedback_file', 'default', '0'),
(790, 'assignfeedback_offline', 'default', '0'),
(791, 'book', 'numberingoptions', '0,1,2,3'),
(792, 'book', 'navoptions', '0,1,2'),
(793, 'book', 'numbering', '1'),
(794, 'book', 'navstyle', '1'),
(795, 'folder', 'showexpanded', '1'),
(796, 'imscp', 'keepold', '1'),
(797, 'imscp', 'keepold_adv', ''),
(798, 'label', 'dndmedia', '1'),
(799, 'label', 'dndresizewidth', '400'),
(800, 'label', 'dndresizeheight', '400'),
(801, 'page', 'displayoptions', '5'),
(802, 'page', 'printheading', '1'),
(803, 'page', 'printintro', '0'),
(804, 'page', 'display', '5'),
(805, 'page', 'popupwidth', '620'),
(806, 'page', 'popupheight', '450'),
(807, 'quiz', 'timelimit', '0'),
(808, 'quiz', 'timelimit_adv', ''),
(809, 'quiz', 'overduehandling', 'autosubmit'),
(810, 'quiz', 'overduehandling_adv', ''),
(811, 'quiz', 'graceperiod', '86400'),
(812, 'quiz', 'graceperiod_adv', ''),
(813, 'quiz', 'graceperiodmin', '60'),
(814, 'quiz', 'attempts', '0'),
(815, 'quiz', 'attempts_adv', ''),
(816, 'quiz', 'grademethod', '1'),
(817, 'quiz', 'grademethod_adv', ''),
(818, 'quiz', 'maximumgrade', '10'),
(819, 'quiz', 'questionsperpage', '1'),
(820, 'quiz', 'questionsperpage_adv', ''),
(821, 'quiz', 'navmethod', 'free'),
(822, 'quiz', 'navmethod_adv', '1'),
(823, 'quiz', 'shuffleanswers', '1'),
(824, 'quiz', 'shuffleanswers_adv', ''),
(825, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(826, 'quiz', 'canredoquestions', '0'),
(827, 'quiz', 'canredoquestions_adv', '1'),
(828, 'quiz', 'attemptonlast', '0'),
(829, 'quiz', 'attemptonlast_adv', '1'),
(830, 'quiz', 'reviewattempt', '69904'),
(831, 'quiz', 'reviewcorrectness', '69904'),
(832, 'quiz', 'reviewmarks', '69904'),
(833, 'quiz', 'reviewspecificfeedback', '69904'),
(834, 'quiz', 'reviewgeneralfeedback', '69904'),
(835, 'quiz', 'reviewrightanswer', '69904'),
(836, 'quiz', 'reviewoverallfeedback', '4368'),
(837, 'quiz', 'showuserpicture', '0'),
(838, 'quiz', 'showuserpicture_adv', ''),
(839, 'quiz', 'decimalpoints', '2'),
(840, 'quiz', 'decimalpoints_adv', ''),
(841, 'quiz', 'questiondecimalpoints', '-1'),
(842, 'quiz', 'questiondecimalpoints_adv', '1'),
(843, 'quiz', 'showblocks', '0'),
(844, 'quiz', 'showblocks_adv', '1'),
(845, 'quiz', 'password', ''),
(846, 'quiz', 'password_adv', '1'),
(847, 'quiz', 'subnet', ''),
(848, 'quiz', 'subnet_adv', '1'),
(849, 'quiz', 'delay1', '0'),
(850, 'quiz', 'delay1_adv', '1'),
(851, 'quiz', 'delay2', '0'),
(852, 'quiz', 'delay2_adv', '1'),
(853, 'quiz', 'browsersecurity', '-'),
(854, 'quiz', 'browsersecurity_adv', '1'),
(855, 'quiz', 'autosaveperiod', '60'),
(856, 'resource', 'framesize', '130'),
(857, 'resource', 'displayoptions', '0,1,4,5,6'),
(858, 'resource', 'printintro', '1'),
(859, 'resource', 'display', '0'),
(860, 'resource', 'showsize', '0'),
(861, 'resource', 'showtype', '0'),
(862, 'resource', 'popupwidth', '620'),
(863, 'resource', 'popupheight', '450'),
(864, 'resource', 'filterfiles', '0'),
(865, 'scorm', 'displaycoursestructure', '0'),
(866, 'scorm', 'displaycoursestructure_adv', ''),
(867, 'scorm', 'popup', '0'),
(868, 'scorm', 'popup_adv', ''),
(869, 'scorm', 'displayactivityname', '1'),
(870, 'scorm', 'framewidth', '100'),
(871, 'scorm', 'framewidth_adv', '1'),
(872, 'scorm', 'frameheight', '500'),
(873, 'scorm', 'frameheight_adv', '1'),
(874, 'scorm', 'winoptgrp_adv', '1'),
(875, 'scorm', 'scrollbars', '0'),
(876, 'scorm', 'directories', '0'),
(877, 'scorm', 'location', '0'),
(878, 'scorm', 'menubar', '0'),
(879, 'scorm', 'toolbar', '0'),
(880, 'scorm', 'status', '0'),
(881, 'scorm', 'skipview', '0'),
(882, 'scorm', 'skipview_adv', '1'),
(883, 'scorm', 'hidebrowse', '0'),
(884, 'scorm', 'hidebrowse_adv', '1'),
(885, 'scorm', 'hidetoc', '0'),
(886, 'scorm', 'hidetoc_adv', '1'),
(887, 'scorm', 'nav', '1'),
(888, 'scorm', 'nav_adv', '1'),
(889, 'scorm', 'navpositionleft', '-100'),
(890, 'scorm', 'navpositionleft_adv', '1'),
(891, 'scorm', 'navpositiontop', '-100'),
(892, 'scorm', 'navpositiontop_adv', '1'),
(893, 'scorm', 'collapsetocwinsize', '767'),
(894, 'scorm', 'collapsetocwinsize_adv', '1'),
(895, 'scorm', 'displayattemptstatus', '1'),
(896, 'scorm', 'displayattemptstatus_adv', ''),
(897, 'scorm', 'grademethod', '1'),
(898, 'scorm', 'maxgrade', '100'),
(899, 'scorm', 'maxattempt', '0'),
(900, 'scorm', 'whatgrade', '0'),
(901, 'scorm', 'forcecompleted', '0'),
(902, 'scorm', 'forcenewattempt', '0'),
(903, 'scorm', 'autocommit', '0'),
(904, 'scorm', 'lastattemptlock', '0'),
(905, 'scorm', 'auto', '0'),
(906, 'scorm', 'updatefreq', '0'),
(907, 'scorm', 'scorm12standard', '1'),
(908, 'scorm', 'allowtypeexternal', '0'),
(909, 'scorm', 'allowtypelocalsync', '0'),
(910, 'scorm', 'allowtypeexternalaicc', '0'),
(911, 'scorm', 'allowaicchacp', '0'),
(912, 'scorm', 'aicchacptimeout', '30'),
(913, 'scorm', 'aicchacpkeepsessiondata', '1'),
(914, 'scorm', 'aiccuserid', '1'),
(915, 'scorm', 'forcejavascript', '1'),
(916, 'scorm', 'allowapidebug', '0'),
(917, 'scorm', 'apidebugmask', '.*'),
(918, 'url', 'framesize', '130'),
(919, 'url', 'secretphrase', ''),
(920, 'url', 'rolesinparams', '0'),
(921, 'url', 'displayoptions', '0,1,5,6'),
(922, 'url', 'printintro', '1'),
(923, 'url', 'display', '0'),
(924, 'url', 'popupwidth', '620'),
(925, 'url', 'popupheight', '450'),
(926, 'workshop', 'grade', '80'),
(927, 'workshop', 'gradinggrade', '20'),
(928, 'workshop', 'gradedecimals', '0'),
(929, 'workshop', 'maxbytes', '0'),
(930, 'workshop', 'strategy', 'accumulative'),
(931, 'workshop', 'examplesmode', '0'),
(932, 'workshopallocation_random', 'numofreviews', '5'),
(933, 'workshopform_numerrors', 'grade0', 'No'),
(934, 'workshopform_numerrors', 'grade1', 'Yes'),
(935, 'workshopeval_best', 'comparison', '5'),
(936, 'block_course_overview', 'defaultmaxcourses', '10'),
(937, 'block_course_overview', 'forcedefaultmaxcourses', '0'),
(938, 'block_course_overview', 'showchildren', '0'),
(939, 'block_course_overview', 'showwelcomearea', '0'),
(940, 'block_course_overview', 'showcategories', '0'),
(941, 'block_section_links', 'numsections1', '22'),
(942, 'block_section_links', 'incby1', '2'),
(943, 'block_section_links', 'numsections2', '40'),
(944, 'block_section_links', 'incby2', '5'),
(945, 'format_singleactivity', 'activitytype', 'forum'),
(946, 'enrol_cohort', 'roleid', '5'),
(947, 'enrol_cohort', 'unenrolaction', '0'),
(948, 'enrol_database', 'dbtype', ''),
(949, 'enrol_database', 'dbhost', 'localhost'),
(950, 'enrol_database', 'dbuser', ''),
(951, 'enrol_database', 'dbpass', ''),
(952, 'enrol_database', 'dbname', ''),
(953, 'enrol_database', 'dbencoding', 'utf-8'),
(954, 'enrol_database', 'dbsetupsql', ''),
(955, 'enrol_database', 'dbsybasequoting', '0'),
(956, 'enrol_database', 'debugdb', '0'),
(957, 'enrol_database', 'localcoursefield', 'idnumber'),
(958, 'enrol_database', 'localuserfield', 'idnumber'),
(959, 'enrol_database', 'localrolefield', 'shortname'),
(960, 'enrol_database', 'localcategoryfield', 'id'),
(961, 'enrol_database', 'remoteenroltable', ''),
(962, 'enrol_database', 'remotecoursefield', ''),
(963, 'enrol_database', 'remoteuserfield', ''),
(964, 'enrol_database', 'remoterolefield', ''),
(965, 'enrol_database', 'remoteotheruserfield', ''),
(966, 'enrol_database', 'defaultrole', '5'),
(967, 'enrol_database', 'ignorehiddencourses', '0'),
(968, 'enrol_database', 'unenrolaction', '0'),
(969, 'enrol_database', 'newcoursetable', ''),
(970, 'enrol_database', 'newcoursefullname', 'fullname'),
(971, 'enrol_database', 'newcourseshortname', 'shortname'),
(972, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(973, 'enrol_database', 'newcoursecategory', ''),
(974, 'enrol_database', 'defaultcategory', '1'),
(975, 'enrol_database', 'templatecourse', ''),
(976, 'enrol_flatfile', 'location', ''),
(977, 'enrol_flatfile', 'encoding', 'UTF-8'),
(978, 'enrol_flatfile', 'mailstudents', '0'),
(979, 'enrol_flatfile', 'mailteachers', '0'),
(980, 'enrol_flatfile', 'mailadmins', '0'),
(981, 'enrol_flatfile', 'unenrolaction', '3'),
(982, 'enrol_flatfile', 'expiredaction', '3'),
(983, 'enrol_guest', 'requirepassword', '0'),
(984, 'enrol_guest', 'usepasswordpolicy', '0'),
(985, 'enrol_guest', 'showhint', '0'),
(986, 'enrol_guest', 'defaultenrol', '1'),
(987, 'enrol_guest', 'status', '1'),
(988, 'enrol_guest', 'status_adv', ''),
(989, 'enrol_imsenterprise', 'imsfilelocation', ''),
(990, 'enrol_imsenterprise', 'logtolocation', ''),
(991, 'enrol_imsenterprise', 'mailadmins', '0'),
(992, 'enrol_imsenterprise', 'createnewusers', '0'),
(993, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(994, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(995, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(996, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(997, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(998, 'enrol_imsenterprise', 'imsrolemap02', '3'),
(999, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(1000, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(1001, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(1002, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(1003, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(1004, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(1005, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(1006, 'enrol_imsenterprise', 'createnewcourses', '0'),
(1007, 'enrol_imsenterprise', 'createnewcategories', '0'),
(1008, 'enrol_imsenterprise', 'imsunenrol', '0'),
(1009, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode'),
(1010, 'enrol_imsenterprise', 'imscoursemapfullname', 'short'),
(1011, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore'),
(1012, 'enrol_imsenterprise', 'imsrestricttarget', '');
INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1013, 'enrol_imsenterprise', 'imscapitafix', '0'),
(1014, 'enrol_manual', 'expiredaction', '1'),
(1015, 'enrol_manual', 'expirynotifyhour', '6'),
(1016, 'enrol_manual', 'defaultenrol', '1'),
(1017, 'enrol_manual', 'status', '0'),
(1018, 'enrol_manual', 'roleid', '5'),
(1019, 'enrol_manual', 'enrolperiod', '0'),
(1020, 'enrol_manual', 'expirynotify', '0'),
(1021, 'enrol_manual', 'expirythreshold', '86400'),
(1022, 'enrol_meta', 'nosyncroleids', ''),
(1023, 'enrol_meta', 'syncall', '1'),
(1024, 'enrol_meta', 'unenrolaction', '3'),
(1025, 'enrol_meta', 'coursesort', 'sortorder'),
(1026, 'enrol_mnet', 'roleid', '5'),
(1027, 'enrol_mnet', 'roleid_adv', '1'),
(1028, 'enrol_paypal', 'paypalbusiness', ''),
(1029, 'enrol_paypal', 'mailstudents', '0'),
(1030, 'enrol_paypal', 'mailteachers', '0'),
(1031, 'enrol_paypal', 'mailadmins', '0'),
(1032, 'enrol_paypal', 'expiredaction', '3'),
(1033, 'enrol_paypal', 'status', '1'),
(1034, 'enrol_paypal', 'cost', '0'),
(1035, 'enrol_paypal', 'currency', 'USD'),
(1036, 'enrol_paypal', 'roleid', '5'),
(1037, 'enrol_paypal', 'enrolperiod', '0'),
(1038, 'enrol_self', 'requirepassword', '0'),
(1039, 'enrol_self', 'usepasswordpolicy', '0'),
(1040, 'enrol_self', 'showhint', '0'),
(1041, 'enrol_self', 'expiredaction', '1'),
(1042, 'enrol_self', 'expirynotifyhour', '6'),
(1043, 'enrol_self', 'defaultenrol', '1'),
(1044, 'enrol_self', 'status', '1'),
(1045, 'enrol_self', 'newenrols', '1'),
(1046, 'enrol_self', 'groupkey', '0'),
(1047, 'enrol_self', 'roleid', '5'),
(1048, 'enrol_self', 'enrolperiod', '0'),
(1049, 'enrol_self', 'expirynotify', '0'),
(1050, 'enrol_self', 'expirythreshold', '86400'),
(1051, 'enrol_self', 'longtimenosee', '0'),
(1052, 'enrol_self', 'maxenrolled', '0'),
(1053, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(1054, 'filter_emoticon', 'formats', '1,4,0'),
(1055, 'filter_mathjaxloader', 'httpurl', 'http://cdn.mathjax.org/mathjax/2.5-latest/MathJax.js'),
(1056, 'filter_mathjaxloader', 'httpsurl', 'https://cdn.mathjax.org/mathjax/2.5-latest/MathJax.js'),
(1057, 'filter_mathjaxloader', 'texfiltercompatibility', '0'),
(1058, 'filter_mathjaxloader', 'mathjaxconfig', '\nMathJax.Hub.Config({\n    config: ["Accessible.js", "Safe.js"],\n    errorSettings: { message: ["!"] },\n    skipStartupTypeset: true,\n    messageStyle: "none"\n});\n'),
(1059, 'filter_mathjaxloader', 'additionaldelimiters', ''),
(1060, 'filter_tex', 'latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(1061, 'filter_tex', 'latexbackground', '#FFFFFF'),
(1062, 'filter_tex', 'density', '120'),
(1063, 'filter_tex', 'pathlatex', 'c:\\texmf\\miktex\\bin\\latex.exe'),
(1064, 'filter_tex', 'pathdvips', 'c:\\texmf\\miktex\\bin\\dvips.exe'),
(1065, 'filter_tex', 'pathconvert', 'c:\\imagemagick\\convert.exe'),
(1066, 'filter_tex', 'pathdvisvgm', 'c:\\texmf\\miktex\\bin\\dvisvgm.exe'),
(1067, 'filter_tex', 'pathmimetex', ''),
(1068, 'filter_tex', 'convertformat', 'gif'),
(1069, 'filter_urltolink', 'formats', '0'),
(1070, 'filter_urltolink', 'embedimages', '1'),
(1071, 'logstore_database', 'dbdriver', ''),
(1072, 'logstore_database', 'dbhost', ''),
(1073, 'logstore_database', 'dbuser', ''),
(1074, 'logstore_database', 'dbpass', ''),
(1075, 'logstore_database', 'dbname', ''),
(1076, 'logstore_database', 'dbtable', ''),
(1077, 'logstore_database', 'dbpersist', '0'),
(1078, 'logstore_database', 'dbsocket', ''),
(1079, 'logstore_database', 'dbport', ''),
(1080, 'logstore_database', 'dbschema', ''),
(1081, 'logstore_database', 'dbcollation', ''),
(1082, 'logstore_database', 'buffersize', '50'),
(1083, 'logstore_database', 'logguests', '0'),
(1084, 'logstore_database', 'includelevels', '1,2,0'),
(1085, 'logstore_database', 'includeactions', 'c,r,u,d'),
(1086, 'logstore_legacy', 'loglegacy', '0'),
(1087, 'logstore_standard', 'logguests', '1'),
(1088, 'logstore_standard', 'loglifetime', '0'),
(1089, 'logstore_standard', 'buffersize', '50'),
(1090, 'editor_atto', 'toolbar', 'collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html'),
(1091, 'editor_atto', 'autosavefrequency', '60'),
(1092, 'atto_collapse', 'showgroups', '5'),
(1093, 'atto_equation', 'librarygroup1', '\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n'),
(1094, 'atto_equation', 'librarygroup2', '\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n'),
(1095, 'atto_equation', 'librarygroup3', '\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n'),
(1096, 'atto_equation', 'librarygroup4', '\n\\sum{a,b}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n'),
(1097, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen'),
(1098, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),
(1099, 'editor_tinymce', 'customconfig', ''),
(1100, 'tinymce_moodleemoticon', 'requireemoticon', '1'),
(1101, 'tinymce_spellchecker', 'spellengine', ''),
(1102, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),
(1103, 'theme_essential', 'version', '2015060200'),
(1104, 'theme_essential', 'pagebackground', ''),
(1105, 'theme_essential', 'pagebackgroundstyle', 'fixed'),
(1106, 'theme_essential', 'pagewidth', '1200'),
(1107, 'theme_essential', 'layout', ''),
(1108, 'theme_essential', 'breadcrumbstyle', '1'),
(1109, 'theme_essential', 'fitvids', '1'),
(1110, 'theme_essential', 'customcss', ''),
(1111, 'theme_essential', 'themecolor', '#30add1'),
(1112, 'theme_essential', 'themetextcolor', '#217a94'),
(1113, 'theme_essential', 'themeurlcolor', '#943b21'),
(1114, 'theme_essential', 'themehovercolor', '#6a2a18'),
(1115, 'theme_essential', 'themeiconcolor', '#30add1'),
(1116, 'theme_essential', 'themenavcolor', '#ffffff'),
(1117, 'theme_essential', 'footercolor', '#555555'),
(1118, 'theme_essential', 'footertextcolor', '#bbbbbb'),
(1119, 'theme_essential', 'footerheadingcolor', '#cccccc'),
(1120, 'theme_essential', 'footersepcolor', '#313131'),
(1121, 'theme_essential', 'footerurlcolor', '#217a94'),
(1122, 'theme_essential', 'footerhovercolor', '#30add1'),
(1123, 'theme_essential', 'enablealternativethemecolors1', ''),
(1124, 'theme_essential', 'alternativethemename1', 'Alternative colours 1'),
(1125, 'theme_essential', 'alternativethemecolor1', '#a430d1'),
(1126, 'theme_essential', 'alternativethemetextcolor1', '#a430d1'),
(1127, 'theme_essential', 'alternativethemeurlcolor1', '#a430d1'),
(1128, 'theme_essential', 'alternativethemehovercolor1', '#9929c4'),
(1129, 'theme_essential', 'enablealternativethemecolors2', ''),
(1130, 'theme_essential', 'alternativethemename2', 'Alternative colours 2'),
(1131, 'theme_essential', 'alternativethemecolor2', '#d15430'),
(1132, 'theme_essential', 'alternativethemetextcolor2', '#d15430'),
(1133, 'theme_essential', 'alternativethemeurlcolor2', '#d15430'),
(1134, 'theme_essential', 'alternativethemehovercolor2', '#c44c29'),
(1135, 'theme_essential', 'enablealternativethemecolors3', ''),
(1136, 'theme_essential', 'alternativethemename3', 'Alternative colours 3'),
(1137, 'theme_essential', 'alternativethemecolor3', '#5dd130'),
(1138, 'theme_essential', 'alternativethemetextcolor3', '#5dd130'),
(1139, 'theme_essential', 'alternativethemeurlcolor3', '#5dd130'),
(1140, 'theme_essential', 'alternativethemehovercolor3', '#53c429'),
(1141, 'theme_essential', 'oldnavbar', ''),
(1142, 'theme_essential', 'siteicon', 'laptop'),
(1143, 'theme_essential', 'logo', ''),
(1144, 'theme_essential', 'headertitle', '1'),
(1145, 'theme_essential', 'navbartitle', '2'),
(1146, 'theme_essential', 'headerbackground', ''),
(1147, 'theme_essential', 'headertextcolor', '#217a94'),
(1148, 'theme_essential', 'displaymycourses', '1'),
(1149, 'theme_essential', 'mycoursetitle', 'course'),
(1150, 'theme_essential', 'helplinktype', '1'),
(1151, 'theme_essential', 'helplink', ''),
(1152, 'theme_essential', 'website', ''),
(1153, 'theme_essential', 'facebook', ''),
(1154, 'theme_essential', 'flickr', ''),
(1155, 'theme_essential', 'twitter', ''),
(1156, 'theme_essential', 'googleplus', ''),
(1157, 'theme_essential', 'linkedin', ''),
(1158, 'theme_essential', 'pinterest', ''),
(1159, 'theme_essential', 'instagram', ''),
(1160, 'theme_essential', 'youtube', ''),
(1161, 'theme_essential', 'skype', ''),
(1162, 'theme_essential', 'vk', ''),
(1163, 'theme_essential', 'android', ''),
(1164, 'theme_essential', 'windows', ''),
(1165, 'theme_essential', 'winphone', ''),
(1166, 'theme_essential', 'ios', ''),
(1167, 'theme_essential', 'iphoneicon', ''),
(1168, 'theme_essential', 'iphoneretinaicon', ''),
(1169, 'theme_essential', 'ipadicon', ''),
(1170, 'theme_essential', 'ipadretinaicon', ''),
(1171, 'theme_essential', 'fontselect', '1'),
(1172, 'theme_essential', 'fontnameheading', 'Verdana'),
(1173, 'theme_essential', 'fontnamebody', 'Verdana'),
(1174, 'theme_essential', 'copyright', ''),
(1175, 'theme_essential', 'footnote', ''),
(1176, 'theme_essential', 'perfinfo', 'min'),
(1177, 'theme_essential', 'courselistteachericon', 'graduation-cap'),
(1178, 'theme_essential', 'togglefrontcontent', '0'),
(1179, 'theme_essential', 'frontcontentarea', ''),
(1180, 'theme_essential', 'frontpageblocks', '1'),
(1181, 'theme_essential', 'frontpagemiddleblocks', '0'),
(1182, 'theme_essential', 'togglemarketing', '1'),
(1183, 'theme_essential', 'marketingheight', '100'),
(1184, 'theme_essential', 'marketing1', ''),
(1185, 'theme_essential', 'marketing1icon', 'star'),
(1186, 'theme_essential', 'marketing1image', ''),
(1187, 'theme_essential', 'marketing1content', ''),
(1188, 'theme_essential', 'marketing1buttontext', ''),
(1189, 'theme_essential', 'marketing1buttonurl', ''),
(1190, 'theme_essential', 'marketing1target', '_blank'),
(1191, 'theme_essential', 'marketing2', ''),
(1192, 'theme_essential', 'marketing2icon', 'star'),
(1193, 'theme_essential', 'marketing2image', ''),
(1194, 'theme_essential', 'marketing2content', ''),
(1195, 'theme_essential', 'marketing2buttontext', ''),
(1196, 'theme_essential', 'marketing2buttonurl', ''),
(1197, 'theme_essential', 'marketing2target', '_blank'),
(1198, 'theme_essential', 'marketing3', ''),
(1199, 'theme_essential', 'marketing3icon', 'star'),
(1200, 'theme_essential', 'marketing3image', ''),
(1201, 'theme_essential', 'marketing3content', ''),
(1202, 'theme_essential', 'marketing3buttontext', ''),
(1203, 'theme_essential', 'marketing3buttonurl', ''),
(1204, 'theme_essential', 'marketing3target', '_blank'),
(1205, 'theme_essential', 'enable1alert', ''),
(1206, 'theme_essential', 'alert1type', 'info'),
(1207, 'theme_essential', 'alert1title', ''),
(1208, 'theme_essential', 'alert1text', ''),
(1209, 'theme_essential', 'enable2alert', ''),
(1210, 'theme_essential', 'alert2type', 'info'),
(1211, 'theme_essential', 'alert2title', ''),
(1212, 'theme_essential', 'alert2text', ''),
(1213, 'theme_essential', 'enable3alert', ''),
(1214, 'theme_essential', 'alert3type', 'info'),
(1215, 'theme_essential', 'alert3title', ''),
(1216, 'theme_essential', 'alert3text', ''),
(1217, 'theme_essential', 'toggleslideshow', '1'),
(1218, 'theme_essential', 'numberofslides', '4'),
(1219, 'theme_essential', 'hideontablet', ''),
(1220, 'theme_essential', 'hideonphone', '1'),
(1221, 'theme_essential', 'slideinterval', '5000'),
(1222, 'theme_essential', 'slidecolor', '#ffffff'),
(1223, 'theme_essential', 'slidecaptionoptions', '0'),
(1224, 'theme_essential', 'slidecaptioncentred', ''),
(1225, 'theme_essential', 'slidebuttoncolor', '#30add1'),
(1226, 'theme_essential', 'slidebuttonhovercolor', '#217a94'),
(1227, 'theme_essential', 'enablecategoryicon', '1'),
(1228, 'theme_essential', 'analyticsenabled', '1'),
(1229, 'theme_essential', 'analytics', 'piwik'),
(1230, 'theme_essential', 'analyticstrackadmin', ''),
(1231, 'theme_essential', 'analyticscleanurl', '1'),
(1232, 'theme_essential', 'slide1', ''),
(1233, 'theme_essential', 'slide1image', ''),
(1234, 'theme_essential', 'slide1caption', ''),
(1235, 'theme_essential', 'slide1url', ''),
(1236, 'theme_essential', 'slide1target', '_blank'),
(1237, 'theme_essential', 'slide2', ''),
(1238, 'theme_essential', 'slide2image', ''),
(1239, 'theme_essential', 'slide2caption', ''),
(1240, 'theme_essential', 'slide2url', ''),
(1241, 'theme_essential', 'slide2target', '_blank'),
(1242, 'theme_essential', 'slide3', ''),
(1243, 'theme_essential', 'slide3image', ''),
(1244, 'theme_essential', 'slide3caption', ''),
(1245, 'theme_essential', 'slide3url', ''),
(1246, 'theme_essential', 'slide3target', '_blank'),
(1247, 'theme_essential', 'slide4', ''),
(1248, 'theme_essential', 'slide4image', ''),
(1249, 'theme_essential', 'slide4caption', ''),
(1250, 'theme_essential', 'slide4url', ''),
(1251, 'theme_essential', 'slide4target', '_blank'),
(1252, 'theme_essential', 'defaultcategoryicon', 'folder-open'),
(1253, 'theme_essential', 'enablecustomcategoryicon', '0'),
(1254, 'theme_essential', 'analyticssiteid', '1'),
(1255, 'theme_essential', 'analyticsimagetrack', '1'),
(1256, 'theme_essential', 'analyticssiteurl', ''),
(1257, 'block_faces', 'version', '2015052915'),
(1258, 'block_font_recents', 'version', '2015051100'),
(1259, 'block_userinfo', 'version', '2013082200'),
(1260, 'block_slideshow', 'version', '2013091800'),
(1261, 'slideshow', 'Max_Slides', '5'),
(1262, 'slideshow', 'Max_Size', '4194304');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context`
--

CREATE TABLE IF NOT EXISTS `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='one of these must be set' AUTO_INCREMENT=54 ;

--
-- Dumping data for table `mdl_context`
--

INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(3, 40, 1, '/1/3', 2),
(4, 30, 1, '/1/4', 2),
(5, 30, 2, '/1/5', 2),
(6, 80, 1, '/1/2/6', 3),
(7, 80, 2, '/1/2/7', 3),
(8, 80, 3, '/1/2/8', 3),
(9, 80, 4, '/1/9', 2),
(10, 80, 5, '/1/10', 2),
(11, 80, 6, '/1/11', 2),
(12, 80, 7, '/1/12', 2),
(13, 80, 8, '/1/13', 2),
(14, 80, 9, '/1/14', 2),
(15, 80, 10, '/1/15', 2),
(16, 80, 11, '/1/16', 2),
(17, 80, 12, '/1/17', 2),
(18, 80, 13, '/1/5/18', 3),
(19, 80, 14, '/1/5/19', 3),
(20, 80, 15, '/1/5/20', 3),
(21, 80, 16, '/1/5/21', 3),
(22, 80, 17, '/1/5/22', 3),
(23, 80, 18, '/1/5/23', 3),
(24, 80, 19, '/1/5/24', 3),
(25, 80, 20, '/1/5/25', 3),
(26, 40, 2, '/1/26', 2),
(27, 50, 2, '/1/26/27', 3),
(28, 80, 21, '/1/26/27/28', 4),
(29, 80, 22, '/1/26/27/29', 4),
(30, 80, 23, '/1/26/27/30', 4),
(31, 80, 24, '/1/26/27/31', 4),
(32, 80, 25, '/1/5/32', 3),
(33, 70, 1, '/1/26/27/33', 4),
(34, 70, 2, '/1/2/34', 3),
(35, 80, 26, '/1/2/35', 3),
(36, 50, 3, '/1/26/36', 3),
(37, 80, 27, '/1/26/36/37', 4),
(38, 80, 28, '/1/26/36/38', 4),
(39, 80, 29, '/1/26/36/39', 4),
(40, 80, 30, '/1/26/36/40', 4),
(41, 50, 4, '/1/26/41', 3),
(42, 80, 31, '/1/26/41/42', 4),
(43, 80, 32, '/1/26/41/43', 4),
(44, 80, 33, '/1/26/41/44', 4),
(45, 80, 34, '/1/26/41/45', 4),
(46, 70, 3, '/1/26/41/46', 4),
(47, 70, 4, '/1/26/36/47', 4),
(48, 80, 35, '/1/2/48', 3),
(49, 50, 5, '/1/26/49', 3),
(50, 80, 36, '/1/26/49/50', 4),
(51, 80, 37, '/1/26/49/51', 4),
(52, 80, 38, '/1/26/49/52', 4),
(53, 80, 39, '/1/26/49/53', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context_temp`
--

CREATE TABLE IF NOT EXISTS `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by build_context_path() in upgrade and cron to keep con';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course`
--

CREATE TABLE IF NOT EXISTS `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  `calendartype` varchar(30) NOT NULL DEFAULT '',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Central course table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_course`
--

INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `newsitems`, `startdate`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `calendartype`, `theme`, `timecreated`, `timemodified`, `requested`, `enablecompletion`, `completionnotify`, `cacherev`) VALUES
(1, 0, 1, 'Elearning', 'Elearning', '', '<p>Elearning<br></p>', 0, 'site', 1, 3, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1435054157, 1435055299, 0, 0, 0, 1436945646),
(2, 2, 20004, 'Lập Trình PHP Căn Bản', 'LTPHP - CB', '', '', 1, 'weeks', 1, 5, 1435165200, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1435141848, 1436957994, 0, 0, 0, 1436957994),
(3, 2, 20003, 'Lập Trình PHP Nâng Cao', 'LTPHP - NC', '', '', 1, 'weeks', 1, 5, 1436979600, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1436943140, 1436958025, 0, 0, 0, 1436958025),
(4, 2, 20002, 'Lập Trình WinDown', 'LTW', '', '', 1, 'weeks', 1, 5, 1436979600, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1436943293, 1436958062, 0, 0, 0, 1436958062),
(5, 2, 20001, 'Lập Trình ASP.NET', 'LTASP', '', '', 1, 'weeks', 1, 5, 1436979600, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1436958114, 1436958114, 0, 0, 0, 1436958116);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `theme` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Course categories' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_course_categories`
--

INSERT INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(1, 'Miscellaneous', NULL, NULL, 0, 0, 10000, 0, 1, 1, 1435054158, 1, '/1', NULL),
(2, 'Khoa Công Nghệ Thông Tin', '', '<p>Khoa Công Nghệ Thông Tin<br></p><p><span style="color: rgb(51, 51, 51); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: 20px; orphans: auto; text-align: right; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">Description</span><br></p>', 1, 0, 20000, 4, 1, 1, 1435141737, 1, '/2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completions`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion aggregation methods for criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion user records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_format_options`
--

CREATE TABLE IF NOT EXISTS `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores format-specific options for the course or course sect' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `mdl_course_format_options`
--

INSERT INTO `mdl_course_format_options` (`id`, `courseid`, `format`, `sectionid`, `name`, `value`) VALUES
(1, 1, 'site', 0, 'numsections', '1'),
(2, 2, 'weeks', 0, 'numsections', '10'),
(3, 2, 'weeks', 0, 'hiddensections', '0'),
(4, 2, 'weeks', 0, 'coursedisplay', '0'),
(5, 3, 'weeks', 0, 'numsections', '10'),
(6, 3, 'weeks', 0, 'hiddensections', '0'),
(7, 3, 'weeks', 0, 'coursedisplay', '0'),
(8, 4, 'weeks', 0, 'numsections', '10'),
(9, 4, 'weeks', 0, 'hiddensections', '0'),
(10, 4, 'weeks', 0, 'coursedisplay', '0'),
(11, 5, 'weeks', 0, 'numsections', '10'),
(12, 5, 'weeks', 0, 'hiddensections', '0'),
(13, 5, 'weeks', 0, 'coursedisplay', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  `availability` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='course_modules table retrofitted from MySQL' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_course_modules`
--

INSERT INTO `mdl_course_modules` (`id`, `course`, `module`, `instance`, `section`, `idnumber`, `added`, `score`, `indent`, `visible`, `visibleold`, `groupmode`, `groupingid`, `completion`, `completiongradeitemnumber`, `completionview`, `completionexpected`, `showdescription`, `availability`) VALUES
(1, 2, 9, 1, 1, NULL, 1435142120, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL),
(2, 1, 9, 2, 2, NULL, 1436924871, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL),
(3, 4, 9, 3, 15, NULL, 1436943356, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL),
(4, 3, 9, 4, 14, NULL, 1436948537, 0, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_completion`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the completion state (completed or not completed, etc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_published`
--

CREATE TABLE IF NOT EXISTS `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about how and when an local courses were publish' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_request`
--

CREATE TABLE IF NOT EXISTS `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='course requests' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availability` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='to define the sections for each course' AUTO_INCREMENT=37 ;

--
-- Dumping data for table `mdl_course_sections`
--

INSERT INTO `mdl_course_sections` (`id`, `course`, `section`, `name`, `summary`, `summaryformat`, `sequence`, `visible`, `availability`) VALUES
(1, 2, 0, NULL, '', 1, '1', 1, NULL),
(2, 1, 0, NULL, '', 1, '2', 1, NULL),
(3, 1, 1, NULL, '', 1, '', 1, NULL),
(4, 2, 1, NULL, '', 1, '', 1, NULL),
(5, 2, 2, NULL, '', 1, '', 1, NULL),
(6, 2, 3, NULL, '', 1, '', 1, NULL),
(7, 2, 4, NULL, '', 1, '', 1, NULL),
(8, 2, 5, NULL, '', 1, '', 1, NULL),
(9, 2, 6, NULL, '', 1, '', 1, NULL),
(10, 2, 7, NULL, '', 1, '', 1, NULL),
(11, 2, 8, NULL, '', 1, '', 1, NULL),
(12, 2, 9, NULL, '', 1, '', 1, NULL),
(13, 2, 10, NULL, '', 1, '', 1, NULL),
(14, 3, 0, NULL, '', 1, '4', 1, NULL),
(15, 4, 0, NULL, '', 1, '3', 1, NULL),
(16, 4, 1, NULL, '', 1, '', 1, NULL),
(17, 4, 2, NULL, '', 1, '', 1, NULL),
(18, 4, 3, NULL, '', 1, '', 1, NULL),
(19, 4, 4, NULL, '', 1, '', 1, NULL),
(20, 4, 5, NULL, '', 1, '', 1, NULL),
(21, 4, 6, NULL, '', 1, '', 1, NULL),
(22, 4, 7, NULL, '', 1, '', 1, NULL),
(23, 4, 8, NULL, '', 1, '', 1, NULL),
(24, 4, 9, NULL, '', 1, '', 1, NULL),
(25, 4, 10, NULL, '', 1, '', 1, NULL),
(26, 3, 1, NULL, '', 1, '', 1, NULL),
(27, 3, 2, NULL, '', 1, '', 1, NULL),
(28, 3, 3, NULL, '', 1, '', 1, NULL),
(29, 3, 4, NULL, '', 1, '', 1, NULL),
(30, 3, 5, NULL, '', 1, '', 1, NULL),
(31, 3, 6, NULL, '', 1, '', 1, NULL),
(32, 3, 7, NULL, '', 1, '', 1, NULL),
(33, 3, 8, NULL, '', 1, '', 1, NULL),
(34, 3, 9, NULL, '', 1, '', 1, NULL),
(35, 3, 10, NULL, '', 1, '', 1, NULL),
(36, 5, 0, NULL, '', 1, '', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data`
--

CREATE TABLE IF NOT EXISTS `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext,
  `listtemplate` longtext,
  `listtemplateheader` longtext,
  `listtemplatefooter` longtext,
  `addtemplate` longtext,
  `rsstemplate` longtext,
  `rsstitletemplate` longtext,
  `csstemplate` longtext,
  `jstemplate` longtext,
  `asearchtemplate` longtext,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all database activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_content`
--

CREATE TABLE IF NOT EXISTS `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext,
  `content1` longtext,
  `content2` longtext,
  `content3` longtext,
  `content4` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the content introduced in each record/fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  `param6` longtext,
  `param7` longtext,
  `param8` longtext,
  `param9` longtext,
  `param10` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every field available' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_records`
--

CREATE TABLE IF NOT EXISTS `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every record introduced' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_editor_atto_autosave`
--

CREATE TABLE IF NOT EXISTS `mdl_editor_atto_autosave` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `elementid` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `pagehash` varchar(64) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `drafttext` longtext NOT NULL,
  `draftid` bigint(10) DEFAULT NULL,
  `pageinstance` varchar(64) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_editattoauto_eleconuse_uix` (`elementid`,`contextid`,`userid`,`pagehash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Draft text that is auto-saved every 5 seconds while an edito' AUTO_INCREMENT=23 ;

--
-- Dumping data for table `mdl_editor_atto_autosave`
--

INSERT INTO `mdl_editor_atto_autosave` (`id`, `elementid`, `contextid`, `pagehash`, `userid`, `drafttext`, `draftid`, `pageinstance`, `timemodified`) VALUES
(2, 'summary', 1, 'f58df7450e50941568e1d4fc991fd27ef597861a', 2, '<p>Elearning<br></p>', NULL, 'yui_3_17_2_2_1435055184844_39', 1435055308),
(3, 'id_s_theme_more_footnote', 1, '51eb1a28bd24b8fd90ea2c96a3f2b427c4a71c00', 2, '', -1, 'yui_3_17_2_2_1435059894468_231', 1435059899),
(4, 'id_summary_editor', 3, 'f866f2ec3fdd1eaf027f862ef05c4e65b12c12e2', 2, '', 897857666, 'yui_3_17_2_2_1435141413277_335', 1435141422);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) DEFAULT NULL,
  `customchar2` varchar(255) DEFAULT NULL,
  `customchar3` varchar(1333) DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext,
  `customtext2` longtext,
  `customtext3` longtext,
  `customtext4` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Instances of enrolment plugins used in courses, fields marke' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `mdl_enrol`
--

INSERT INTO `mdl_enrol` (`id`, `enrol`, `status`, `courseid`, `sortorder`, `name`, `enrolperiod`, `enrolstartdate`, `enrolenddate`, `expirynotify`, `expirythreshold`, `notifyall`, `password`, `cost`, `currency`, `roleid`, `customint1`, `customint2`, `customint3`, `customint4`, `customint5`, `customint6`, `customint7`, `customint8`, `customchar1`, `customchar2`, `customchar3`, `customdec1`, `customdec2`, `customtext1`, `customtext2`, `customtext3`, `customtext4`, `timecreated`, `timemodified`) VALUES
(1, 'manual', 0, 2, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1435141851, 1435141851),
(2, 'guest', 0, 2, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1435141851, 1436957995),
(3, 'self', 1, 2, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1435141851, 1435141851),
(4, 'manual', 0, 3, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1436943142, 1436943142),
(5, 'guest', 1, 3, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1436943142, 1436958025),
(6, 'self', 1, 3, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1436943142, 1436943142),
(7, 'manual', 0, 4, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1436943295, 1436943295),
(8, 'guest', 1, 4, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1436943295, 1436958063),
(9, 'self', 1, 4, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1436943295, 1436943295),
(10, 'manual', 0, 5, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1436958116, 1436958116),
(11, 'guest', 1, 5, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1436958116, 1436958116),
(12, 'self', 1, 5, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1436958116, 1436958116);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_flatfile`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='enrol_flatfile table retrofitted from MySQL' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_paypal`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) NOT NULL DEFAULT '',
  `receiver_email` varchar(255) NOT NULL DEFAULT '',
  `receiver_id` varchar(255) NOT NULL DEFAULT '',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) NOT NULL DEFAULT '',
  `tax` varchar(255) NOT NULL DEFAULT '',
  `option_name1` varchar(255) NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) NOT NULL DEFAULT '',
  `option_name2` varchar(255) NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) NOT NULL DEFAULT '',
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `pending_reason` varchar(255) NOT NULL DEFAULT '',
  `reason_code` varchar(30) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) NOT NULL DEFAULT '',
  `payment_type` varchar(30) NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about PayPal transactions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event`
--

CREATE TABLE IF NOT EXISTS `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `description` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For everything with a time associated to it' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) NOT NULL DEFAULT '',
  `component` varchar(166) NOT NULL DEFAULT '',
  `handlerfile` varchar(255) NOT NULL DEFAULT '',
  `handlerfunction` longtext,
  `schedule` varchar(255) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing which components requests what typ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext NOT NULL,
  `stackdump` longtext,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing queued events. It stores only one ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is the list of queued handlers for processing. The even' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks subscriptions to remote calendars.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `classname` varchar(100) NOT NULL DEFAULT '',
  `methodname` varchar(100) NOT NULL DEFAULT '',
  `classpath` varchar(255) DEFAULT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `capabilities` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='list of all external functions' AUTO_INCREMENT=146 ;

--
-- Dumping data for table `mdl_external_functions`
--

INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`) VALUES
(1, 'core_cohort_create_cohorts', 'core_cohort_external', 'create_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(2, 'core_cohort_delete_cohorts', 'core_cohort_external', 'delete_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(3, 'core_cohort_get_cohorts', 'core_cohort_external', 'get_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(4, 'core_cohort_update_cohorts', 'core_cohort_external', 'update_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(5, 'core_cohort_add_cohort_members', 'core_cohort_external', 'add_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(6, 'core_cohort_delete_cohort_members', 'core_cohort_external', 'delete_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(7, 'core_cohort_get_cohort_members', 'core_cohort_external', 'get_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(8, 'core_comment_get_comments', 'core_comment_external', 'get_comments', NULL, 'moodle', 'moodle/comment:view'),
(9, 'core_grades_get_grades', 'core_grades_external', 'get_grades', NULL, 'moodle', 'moodle/grade:view, moodle/grade:viewall, moodle/grade:viewhidden'),
(10, 'core_grades_update_grades', 'core_grades_external', 'update_grades', NULL, 'moodle', ''),
(11, 'moodle_group_create_groups', 'moodle_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(12, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(13, 'moodle_group_get_groups', 'moodle_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(14, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(15, 'moodle_group_get_course_groups', 'moodle_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(16, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(17, 'moodle_group_delete_groups', 'moodle_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(18, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(19, 'moodle_group_get_groupmembers', 'moodle_group_external', 'get_groupmembers', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(20, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(21, 'moodle_group_add_groupmembers', 'moodle_group_external', 'add_groupmembers', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(22, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(23, 'moodle_group_delete_groupmembers', 'moodle_group_external', 'delete_groupmembers', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(24, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(25, 'core_group_create_groupings', 'core_group_external', 'create_groupings', 'group/externallib.php', 'moodle', ''),
(26, 'core_group_update_groupings', 'core_group_external', 'update_groupings', 'group/externallib.php', 'moodle', ''),
(27, 'core_group_get_groupings', 'core_group_external', 'get_groupings', 'group/externallib.php', 'moodle', ''),
(28, 'core_group_get_course_groupings', 'core_group_external', 'get_course_groupings', 'group/externallib.php', 'moodle', ''),
(29, 'core_group_delete_groupings', 'core_group_external', 'delete_groupings', 'group/externallib.php', 'moodle', ''),
(30, 'core_group_assign_grouping', 'core_group_external', 'assign_grouping', 'group/externallib.php', 'moodle', ''),
(31, 'core_group_unassign_grouping', 'core_group_external', 'unassign_grouping', 'group/externallib.php', 'moodle', ''),
(32, 'core_group_get_course_user_groups', 'core_group_external', 'get_course_user_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(33, 'core_notes_get_course_notes', 'core_notes_external', 'get_course_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view'),
(34, 'moodle_file_get_files', 'moodle_file_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(35, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(36, 'moodle_file_upload', 'moodle_file_external', 'upload', 'files/externallib.php', 'moodle', ''),
(37, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(38, 'moodle_user_create_users', 'moodle_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(39, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(40, 'core_user_get_users', 'core_user_external', 'get_users', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(41, 'moodle_user_get_users_by_id', 'moodle_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(42, 'core_user_get_users_by_field', 'core_user_external', 'get_users_by_field', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(43, 'core_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(44, 'moodle_user_get_users_by_courseid', 'moodle_user_external', 'get_users_by_courseid', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(45, 'moodle_user_get_course_participants_by_id', 'moodle_user_external', 'get_course_participants_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(46, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(47, 'moodle_user_delete_users', 'moodle_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(48, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(49, 'moodle_user_update_users', 'moodle_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(50, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(51, 'core_user_add_user_device', 'core_user_external', 'add_user_device', 'user/externallib.php', 'moodle', ''),
(52, 'core_user_remove_user_device', 'core_user_external', 'remove_user_device', 'user/externallib.php', 'moodle', ''),
(53, 'core_user_view_user_list', 'core_user_external', 'view_user_list', 'user/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(54, 'core_user_view_user_profile', 'core_user_external', 'view_user_profile', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails'),
(55, 'core_enrol_get_enrolled_users_with_capability', 'core_enrol_external', 'get_enrolled_users_with_capability', 'enrol/externallib.php', 'moodle', ''),
(56, 'moodle_enrol_get_enrolled_users', 'moodle_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),
(57, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(58, 'moodle_enrol_get_users_courses', 'moodle_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(59, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(60, 'core_enrol_get_course_enrolment_methods', 'core_enrol_external', 'get_course_enrolment_methods', 'enrol/externallib.php', 'moodle', ''),
(61, 'moodle_role_assign', 'moodle_enrol_external', 'role_assign', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(62, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(63, 'moodle_role_unassign', 'moodle_enrol_external', 'role_unassign', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(64, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(65, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:viewhiddencourses'),
(66, 'moodle_course_get_courses', 'moodle_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(67, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(68, 'moodle_course_create_courses', 'moodle_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(69, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(70, 'core_course_delete_courses', 'core_course_external', 'delete_courses', 'course/externallib.php', 'moodle', 'moodle/course:delete'),
(71, 'core_course_delete_modules', 'core_course_external', 'delete_modules', 'course/externallib.php', 'moodle', 'moodle/course:manageactivities'),
(72, 'core_course_duplicate_course', 'core_course_external', 'duplicate_course', 'course/externallib.php', 'moodle', 'moodle/backup:backupcourse,moodle/restore:restorecourse,moodle/course:create'),
(73, 'core_course_update_courses', 'core_course_external', 'update_courses', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:changecategory,moodle/course:changefullname,moodle/course:changeshortname,moodle/course:changeidnumber,moodle/course:changesummary,moodle/course:visibility'),
(74, 'core_course_view_course', 'core_course_external', 'view_course', 'course/externallib.php', 'moodle', ''),
(75, 'core_course_get_categories', 'core_course_external', 'get_categories', 'course/externallib.php', 'moodle', 'moodle/category:viewhiddencategories'),
(76, 'core_course_create_categories', 'core_course_external', 'create_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(77, 'core_course_update_categories', 'core_course_external', 'update_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(78, 'core_course_delete_categories', 'core_course_external', 'delete_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(79, 'core_course_import_course', 'core_course_external', 'import_course', 'course/externallib.php', 'moodle', 'moodle/backup:backuptargetimport, moodle/restore:restoretargetimport'),
(80, 'moodle_message_send_instantmessages', 'moodle_message_external', 'send_instantmessages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(81, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(82, 'core_message_create_contacts', 'core_message_external', 'create_contacts', 'message/externallib.php', 'moodle', ''),
(83, 'core_message_delete_contacts', 'core_message_external', 'delete_contacts', 'message/externallib.php', 'moodle', ''),
(84, 'core_message_block_contacts', 'core_message_external', 'block_contacts', 'message/externallib.php', 'moodle', ''),
(85, 'core_message_unblock_contacts', 'core_message_external', 'unblock_contacts', 'message/externallib.php', 'moodle', ''),
(86, 'core_message_get_contacts', 'core_message_external', 'get_contacts', 'message/externallib.php', 'moodle', ''),
(87, 'core_message_search_contacts', 'core_message_external', 'search_contacts', 'message/externallib.php', 'moodle', ''),
(88, 'core_message_get_messages', 'core_message_external', 'get_messages', 'message/externallib.php', 'moodle', ''),
(89, 'core_message_get_blocked_users', 'core_message_external', 'get_blocked_users', 'message/externallib.php', 'moodle', ''),
(90, 'core_message_mark_message_read', 'core_message_external', 'mark_message_read', 'message/externallib.php', 'moodle', ''),
(91, 'moodle_notes_create_notes', 'moodle_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(92, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(93, 'core_notes_delete_notes', 'core_notes_external', 'delete_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(94, 'core_notes_get_notes', 'core_notes_external', 'get_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view'),
(95, 'core_notes_update_notes', 'core_notes_external', 'update_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(96, 'core_notes_view_notes', 'core_notes_external', 'view_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view'),
(97, 'core_grading_get_definitions', 'core_grading_external', 'get_definitions', NULL, 'moodle', ''),
(98, 'core_grade_get_definitions', 'core_grade_external', 'get_definitions', 'grade/externallib.php', 'moodle', ''),
(99, 'core_grading_save_definitions', 'core_grading_external', 'save_definitions', NULL, 'moodle', ''),
(100, 'core_grading_get_gradingform_instances', 'core_grading_external', 'get_gradingform_instances', NULL, 'moodle', ''),
(101, 'moodle_webservice_get_siteinfo', 'moodle_webservice_external', 'get_siteinfo', 'webservice/externallib.php', 'moodle', ''),
(102, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(103, 'core_get_string', 'core_external', 'get_string', 'lib/external/externallib.php', 'moodle', ''),
(104, 'core_get_strings', 'core_external', 'get_strings', 'lib/external/externallib.php', 'moodle', ''),
(105, 'core_get_component_strings', 'core_external', 'get_component_strings', 'lib/external/externallib.php', 'moodle', ''),
(106, 'core_calendar_delete_calendar_events', 'core_calendar_external', 'delete_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(107, 'core_calendar_get_calendar_events', 'core_calendar_external', 'get_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(108, 'core_calendar_create_calendar_events', 'core_calendar_external', 'create_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(109, 'core_output_load_template', 'core\\output\\external', 'load_template', NULL, 'moodle', ''),
(110, 'core_completion_update_activity_completion_status_manually', 'core_completion_external', 'update_activity_completion_status_manually', NULL, 'moodle', ''),
(111, 'core_completion_get_activities_completion_status', 'core_completion_external', 'get_activities_completion_status', NULL, 'moodle', ''),
(112, 'core_completion_get_course_completion_status', 'core_completion_external', 'get_course_completion_status', NULL, 'moodle', 'report/completion:view'),
(113, 'core_rating_get_item_ratings', 'core_rating_external', 'get_item_ratings', NULL, 'moodle', 'moodle/rating:view'),
(114, 'mod_assign_get_grades', 'mod_assign_external', 'get_grades', 'mod/assign/externallib.php', 'mod_assign', ''),
(115, 'mod_assign_get_assignments', 'mod_assign_external', 'get_assignments', 'mod/assign/externallib.php', 'mod_assign', ''),
(116, 'mod_assign_get_submissions', 'mod_assign_external', 'get_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(117, 'mod_assign_get_user_flags', 'mod_assign_external', 'get_user_flags', 'mod/assign/externallib.php', 'mod_assign', ''),
(118, 'mod_assign_set_user_flags', 'mod_assign_external', 'set_user_flags', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:grade'),
(119, 'mod_assign_get_user_mappings', 'mod_assign_external', 'get_user_mappings', 'mod/assign/externallib.php', 'mod_assign', ''),
(120, 'mod_assign_revert_submissions_to_draft', 'mod_assign_external', 'revert_submissions_to_draft', 'mod/assign/externallib.php', 'mod_assign', ''),
(121, 'mod_assign_lock_submissions', 'mod_assign_external', 'lock_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(122, 'mod_assign_unlock_submissions', 'mod_assign_external', 'unlock_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(123, 'mod_assign_save_submission', 'mod_assign_external', 'save_submission', 'mod/assign/externallib.php', 'mod_assign', ''),
(124, 'mod_assign_submit_for_grading', 'mod_assign_external', 'submit_for_grading', 'mod/assign/externallib.php', 'mod_assign', ''),
(125, 'mod_assign_save_grade', 'mod_assign_external', 'save_grade', 'mod/assign/externallib.php', 'mod_assign', ''),
(126, 'mod_assign_save_grades', 'mod_assign_external', 'save_grades', 'mod/assign/externallib.php', 'mod_assign', ''),
(127, 'mod_assign_save_user_extensions', 'mod_assign_external', 'save_user_extensions', 'mod/assign/externallib.php', 'mod_assign', ''),
(128, 'mod_assign_reveal_identities', 'mod_assign_external', 'reveal_identities', 'mod/assign/externallib.php', 'mod_assign', ''),
(129, 'mod_data_get_databases_by_courses', 'mod_data_external', 'get_databases_by_courses', NULL, 'mod_data', 'mod/data:viewentry'),
(130, 'mod_forum_get_forums_by_courses', 'mod_forum_external', 'get_forums_by_courses', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion'),
(131, 'mod_forum_get_forum_discussions', 'mod_forum_external', 'get_forum_discussions', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),
(132, 'mod_forum_get_forum_discussion_posts', 'mod_forum_external', 'get_forum_discussion_posts', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),
(133, 'mod_forum_get_forum_discussions_paginated', 'mod_forum_external', 'get_forum_discussions_paginated', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),
(134, 'mod_forum_view_forum', 'mod_forum_external', 'view_forum', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion'),
(135, 'mod_forum_view_forum_discussion', 'mod_forum_external', 'view_forum_discussion', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion'),
(136, 'moodle_enrol_manual_enrol_users', 'moodle_enrol_manual_external', 'manual_enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(137, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(138, 'enrol_manual_unenrol_users', 'enrol_manual_external', 'unenrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:unenrol'),
(139, 'enrol_self_get_instance_info', 'enrol_self_external', 'get_instance_info', 'enrol/self/externallib.php', 'enrol_self', ''),
(140, 'message_airnotifier_is_system_configured', 'message_airnotifier_external', 'is_system_configured', 'message/output/airnotifier/externallib.php', 'message_airnotifier', ''),
(141, 'message_airnotifier_are_notification_preferences_configured', 'message_airnotifier_external', 'are_notification_preferences_configured', 'message/output/airnotifier/externallib.php', 'message_airnotifier', ''),
(142, 'gradereport_user_get_grades_table', 'gradereport_user_external', 'get_grades_table', 'grade/report/user/externallib.php', 'gradereport_user', 'gradereport/user:view'),
(143, 'gradereport_user_view_grade_report', 'gradereport_user_external', 'view_grade_report', 'grade/report/user/externallib.php', 'gradereport_user', 'gradereport/user:view'),
(144, 'tool_templatelibrary_list_templates', 'tool_templatelibrary\\external', 'list_templates', NULL, 'tool_templatelibrary', ''),
(145, 'tool_templatelibrary_load_canonical_template', 'tool_templatelibrary\\external', 'load_canonical_template', NULL, 'tool_templatelibrary', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='built in and custom external services' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_external_services`
--

INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`, `uploadfiles`) VALUES
(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1435054211, NULL, 'moodle_mobile_app', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='lists functions available in each service group' AUTO_INCREMENT=68 ;

--
-- Dumping data for table `mdl_external_services_functions`
--

INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'moodle_enrol_get_users_courses'),
(2, 1, 'moodle_enrol_get_enrolled_users'),
(3, 1, 'moodle_user_get_users_by_id'),
(4, 1, 'moodle_webservice_get_siteinfo'),
(5, 1, 'moodle_notes_create_notes'),
(6, 1, 'moodle_user_get_course_participants_by_id'),
(7, 1, 'moodle_user_get_users_by_courseid'),
(8, 1, 'moodle_message_send_instantmessages'),
(9, 1, 'core_course_get_contents'),
(10, 1, 'core_get_component_strings'),
(11, 1, 'core_user_add_user_device'),
(12, 1, 'core_calendar_get_calendar_events'),
(13, 1, 'core_enrol_get_users_courses'),
(14, 1, 'core_enrol_get_enrolled_users'),
(15, 1, 'core_user_get_users_by_id'),
(16, 1, 'core_webservice_get_site_info'),
(17, 1, 'core_notes_create_notes'),
(18, 1, 'core_user_get_course_user_profiles'),
(19, 1, 'core_message_send_instant_messages'),
(20, 1, 'mod_assign_get_grades'),
(21, 1, 'mod_assign_get_assignments'),
(22, 1, 'mod_assign_get_submissions'),
(23, 1, 'mod_assign_get_user_flags'),
(24, 1, 'mod_assign_set_user_flags'),
(25, 1, 'mod_assign_get_user_mappings'),
(26, 1, 'mod_assign_revert_submissions_to_draft'),
(27, 1, 'mod_assign_lock_submissions'),
(28, 1, 'mod_assign_unlock_submissions'),
(29, 1, 'mod_assign_save_submission'),
(30, 1, 'mod_assign_submit_for_grading'),
(31, 1, 'mod_assign_save_grade'),
(32, 1, 'mod_assign_save_user_extensions'),
(33, 1, 'mod_assign_reveal_identities'),
(34, 1, 'message_airnotifier_is_system_configured'),
(35, 1, 'message_airnotifier_are_notification_preferences_configured'),
(36, 1, 'core_grades_update_grades'),
(37, 1, 'mod_forum_get_forums_by_courses'),
(38, 1, 'mod_forum_get_forum_discussions_paginated'),
(39, 1, 'mod_forum_get_forum_discussion_posts'),
(40, 1, 'core_files_get_files'),
(41, 1, 'core_message_get_messages'),
(42, 1, 'core_message_create_contacts'),
(43, 1, 'core_message_delete_contacts'),
(44, 1, 'core_message_block_contacts'),
(45, 1, 'core_message_unblock_contacts'),
(46, 1, 'core_message_get_contacts'),
(47, 1, 'core_message_search_contacts'),
(48, 1, 'core_message_get_blocked_users'),
(49, 1, 'gradereport_user_get_grades_table'),
(50, 1, 'core_group_get_course_user_groups'),
(51, 1, 'core_user_remove_user_device'),
(52, 1, 'core_course_get_courses'),
(53, 1, 'core_completion_update_activity_completion_status_manually'),
(54, 1, 'mod_data_get_databases_by_courses'),
(55, 1, 'core_comment_get_comments'),
(56, 1, 'mod_forum_view_forum'),
(57, 1, 'core_course_view_course'),
(58, 1, 'core_completion_get_activities_completion_status'),
(59, 1, 'core_notes_get_course_notes'),
(60, 1, 'core_completion_get_course_completion_status'),
(61, 1, 'core_user_view_user_list'),
(62, 1, 'core_message_mark_message_read'),
(63, 1, 'core_notes_view_notes'),
(64, 1, 'mod_forum_view_forum_discussion'),
(65, 1, 'core_user_view_user_profile'),
(66, 1, 'gradereport_user_view_grade_report'),
(67, 1, 'core_rating_get_item_ratings');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_users`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='users allowed to use services with restricted users flag' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_tokens`
--

CREATE TABLE IF NOT EXISTS `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Security tokens for accessing of external services' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) NOT NULL DEFAULT '',
  `page_after_submit` longtext NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all feedbacks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completed`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completedtmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_item`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `presentation` longtext NOT NULL,
  `typ` varchar(255) NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) NOT NULL DEFAULT '',
  `options` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback_items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback sitecourse map' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_template`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='templates of feedbackstructures' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_tracking`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_tracking` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtrac_use_ix` (`userid`),
  KEY `mdl_feedtrac_fee_ix` (`feedback`),
  KEY `mdl_feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback trackingdata' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_value`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completeds' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_valuetmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completedstmp' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files`
--

CREATE TABLE IF NOT EXISTS `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext,
  `author` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='description of files, content is stored in sha1 file pool' AUTO_INCREMENT=40 ;

--
-- Dumping data for table `mdl_files`
--

INSERT INTO `mdl_files` (`id`, `contenthash`, `pathnamehash`, `contextid`, `component`, `filearea`, `itemid`, `filepath`, `filename`, `userid`, `filesize`, `mimetype`, `status`, `source`, `author`, `license`, `timecreated`, `timemodified`, `sortorder`, `referencefileid`) VALUES
(1, '41cfeee5884a43a4650a851f4f85e7b28316fcc9', 'a48e186a2cc853a9e94e9305f4e9bc086391212d', 1, 'theme_more', 'backgroundimage', 0, '/', 'background.jpg', 2, 4451, 'image/jpeg', 0, NULL, NULL, NULL, 1435054673, 1435054673, 0, NULL),
(2, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'd1da7ab1bb9c08a926037367bf8ce9a838034ead', 1, 'theme_more', 'backgroundimage', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1435054673, 1435054673, 0, NULL),
(3, 'fb262df98d67c4e2a5c9802403821e00cf2992af', '508e674d49c30d4fde325fe6c7f6fd3d56b247e1', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'smile.png', 2, 1600, 'image/png', 0, NULL, NULL, NULL, 1435054681, 1435054681, 0, NULL),
(4, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '70b7cdade7b4e27d4e83f0cdaad10d6a3c0cccb5', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1435054682, 1435054682, 0, NULL),
(5, 'a4f146f120e7e00d21291b924e26aaabe9f4297a', '68317eab56c67d32aeaee5acf509a0c4aa828b6b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'sad.png', 2, 1702, 'image/png', 0, NULL, NULL, NULL, 1435054682, 1435054682, 0, NULL),
(6, '33957e31ba9c763a74638b825f0a9154acf475e1', '695a55ff780e61c9e59428aa425430b0d6bde53b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'tick.png', 2, 1187, 'image/png', 0, NULL, NULL, NULL, 1435054682, 1435054682, 0, NULL),
(7, 'd613d55f37bb76d38d4ffb4b7b83e6c694778c30', '373e63af262a9b8466ba8632551520be793c37ff', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'cross.png', 2, 1230, 'image/png', 0, NULL, NULL, NULL, 1435054682, 1435054682, 0, NULL),
(8, '41cfeee5884a43a4650a851f4f85e7b28316fcc9', '2fdf0d73366c0bda47624556562d5a4810740a33', 5, 'user', 'draft', 493469238, '/', 'background.jpg', 2, 4451, 'image/jpeg', 0, 'O:8:"stdClass":2:{s:6:"source";N;s:8:"original";s:236:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjEwOiJ0aGVtZV9tb3JlIjtzOjY6Iml0ZW1pZCI7aTowO3M6ODoiZmlsZWFyZWEiO3M6MTU6ImJhY2tncm91bmRpbWFnZSI7czo4OiJmaWxlcGF0aCI7czoxOiIvIjtzOjg6ImZpbGVuYW1lIjtzOjE0OiJiYWNrZ3JvdW5kLmpwZyI7fQ==";}', NULL, NULL, 1435054673, 1435054673, 0, NULL),
(9, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'f98be5abb3594c6f9fa7135e2420fd37ee5e7e78', 5, 'user', 'draft', 493469238, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1435059894, 1435059894, 0, NULL),
(10, '1bced679e41c40f78949da1024661e5301c35631', 'dac5349202a9b83a50d38beac58b291f4905a98f', 1, 'core', 'preview', 0, '/thumb/', '41cfeee5884a43a4650a851f4f85e7b28316fcc9', NULL, 8237, 'image/png', 0, NULL, NULL, NULL, 1435059903, 1435059903, 0, NULL),
(11, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '74c104d54c05b5f8c633a36da516d37e6c5279e4', 1, 'core', 'preview', 0, '/thumb/', '.', NULL, 0, NULL, 0, NULL, NULL, NULL, 1435059903, 1435059903, 0, NULL),
(12, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '884555719c50529b9df662a38619d04b5b11e25c', 1, 'core', 'preview', 0, '/', '.', NULL, 0, NULL, 0, NULL, NULL, NULL, 1435059903, 1435059903, 0, NULL),
(13, 'c281b20f562a984c41e4c7ab8332bbe85ccbce83', '1da7932dbe9c62e373370dc37ebf75f3c0339c9c', 5, 'user', 'draft', 672302246, '/', 'theme_essential_moodle28_2015060200.zip', 2, 1803752, 'application/zip', 0, 'O:8:"stdClass":1:{s:6:"source";s:39:"theme_essential_moodle28_2015060200.zip";}', 'Admin User', 'allrightsreserved', 1435142524, 1435142524, 0, NULL),
(14, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'b11cbf26208a8b637972cdc61e1b1ae497e53c0c', 5, 'user', 'draft', 672302246, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1435142524, 1435142524, 0, NULL),
(15, 'e4da866c60449f93a87874b3e73e2e0d0436b79c', '134b51c447996c6722326c07fb86c8b356951b97', 5, 'user', 'draft', 334564209, '/', 'hinh1.jpg', 2, 58817, 'image/jpeg', 0, 'O:8:"stdClass":1:{s:6:"source";s:9:"hinh1.jpg";}', 'Admin User', 'allrightsreserved', 1436930170, 1436930170, 0, NULL),
(16, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'ca842ac112a75bebba720447fa18753c6bcb5806', 5, 'user', 'draft', 334564209, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1436930170, 1436930170, 0, NULL),
(17, 'd37b396d50042eee827e6e1ac8ef42f89821082e', 'ef9186b0e462c3cc93ad023a0db066cfe298659a', 1, 'core', 'preview', 0, '/thumb/', 'e4da866c60449f93a87874b3e73e2e0d0436b79c', NULL, 9204, 'image/png', 0, NULL, NULL, NULL, 1436930172, 1436930172, 0, NULL),
(18, 'e4da866c60449f93a87874b3e73e2e0d0436b79c', 'f220c4048ba990225458aa6db06650d9a8fe366c', 27, 'course', 'overviewfiles', 0, '/', 'hinh1.jpg', 2, 58817, 'image/jpeg', 0, 'hinh1.jpg', 'Admin User', 'allrightsreserved', 1436930170, 1436930178, 0, NULL),
(19, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '82416ee08bf28241281771a1012cd595c6dc895d', 27, 'course', 'overviewfiles', 0, '/', '.', 2, 0, 'document/unknown', 0, NULL, NULL, NULL, 1436930170, 1436957971, 0, NULL),
(20, '4c2618d688febcf2c5ba18ad564c105e8383429f', 'f31a003b863472f3724115425f415571a7fa95fd', 5, 'user', 'draft', 545227051, '/', 'hinh3.jpg', 2, 36419, 'image/jpeg', 0, 'O:8:"stdClass":1:{s:6:"source";s:9:"hinh3.jpg";}', 'Admin User', 'allrightsreserved', 1436948792, 1436948792, 0, NULL),
(21, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'd996cdb6bf9bb640a4ccb7aaac11a5266b1d0457', 5, 'user', 'draft', 545227051, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1436948792, 1436948792, 0, NULL),
(22, '79aecaae5e3705dd981a12fa8e596dbc7f2bb815', '64c6f326ab16bdcc87ca3991d259c1671681e757', 1, 'core', 'preview', 0, '/thumb/', '4c2618d688febcf2c5ba18ad564c105e8383429f', NULL, 7088, 'image/png', 0, NULL, NULL, NULL, 1436948794, 1436948794, 0, NULL),
(23, '4c2618d688febcf2c5ba18ad564c105e8383429f', '992bffed9a1f66f6503b4e69fac178031063c2bf', 36, 'course', 'overviewfiles', 0, '/', 'hinh3.jpg', 2, 36419, 'image/jpeg', 0, 'hinh3.jpg', 'Admin User', 'allrightsreserved', 1436948792, 1436948796, 0, NULL),
(24, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'efd71280fe19db7f625e9e7db8c41012d36238e7', 36, 'course', 'overviewfiles', 0, '/', '.', 2, 0, 'document/unknown', 0, NULL, NULL, NULL, 1436948792, 1436958003, 0, NULL),
(25, '0e077f66b6cef27d52a67d952cecf41369741bfb', 'c62017fbe2f7d3e213bdbd9a3cf617e5a8d403cf', 5, 'user', 'draft', 369323731, '/', 'hinh4.jpg', 2, 68734, 'image/jpeg', 0, 'O:8:"stdClass":1:{s:6:"source";s:9:"hinh4.jpg";}', 'Admin User', 'allrightsreserved', 1436957093, 1436957093, 0, NULL),
(26, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '1951093a33fff259dac6d4d6647570da8750f024', 5, 'user', 'draft', 369323731, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1436957093, 1436957093, 0, NULL),
(27, '116a25877300ac48a90bd6f472a2c4d457a6ae46', 'a871e3d6177dc83300fe97bf9c6537c7e3ba6daf', 1, 'core', 'preview', 0, '/thumb/', '0e077f66b6cef27d52a67d952cecf41369741bfb', NULL, 19268, 'image/png', 0, NULL, NULL, NULL, 1436957095, 1436957095, 0, NULL),
(28, '0e077f66b6cef27d52a67d952cecf41369741bfb', 'a202e51b9028a09c14e27169c25a381e0107a363', 41, 'course', 'overviewfiles', 0, '/', 'hinh4.jpg', 2, 68734, 'image/jpeg', 0, 'hinh4.jpg', 'Admin User', 'allrightsreserved', 1436957093, 1436957107, 0, NULL),
(29, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'f91d5eeaf3c7532743b4d11236559c4a8a9cd7d6', 41, 'course', 'overviewfiles', 0, '/', '.', 2, 0, 'document/unknown', 0, NULL, NULL, NULL, 1436957093, 1436958034, 0, NULL),
(30, 'e4da866c60449f93a87874b3e73e2e0d0436b79c', '9007bcb467558b9b2018f67e4af98995f2f3f283', 5, 'user', 'draft', 475219727, '/', 'hinh1.jpg', 2, 58817, 'image/jpeg', 0, 'O:8:"stdClass":2:{s:6:"source";s:9:"hinh1.jpg";s:8:"original";s:220:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToyNztzOjk6ImNvbXBvbmVudCI7czo2OiJjb3Vyc2UiO3M6NjoiaXRlbWlkIjtpOjA7czo4OiJmaWxlYXJlYSI7czoxMzoib3ZlcnZpZXdmaWxlcyI7czo4OiJmaWxlcGF0aCI7czoxOiIvIjtzOjg6ImZpbGVuYW1lIjtzOjk6ImhpbmgxLmpwZyI7fQ==";}', 'Admin User', 'allrightsreserved', 1436930170, 1436930178, 0, NULL),
(31, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '5eafe06fc026adca13f80b5d7dd178e07239cfb8', 5, 'user', 'draft', 475219727, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1436957971, 1436957971, 0, NULL),
(32, '4c2618d688febcf2c5ba18ad564c105e8383429f', '4e8834aaa519363df32bef9f243501bbec22765d', 5, 'user', 'draft', 618133545, '/', 'hinh3.jpg', 2, 36419, 'image/jpeg', 0, 'O:8:"stdClass":2:{s:6:"source";s:9:"hinh3.jpg";s:8:"original";s:220:"YTo2OntzOjk6ImNvbnRleHRpZCI7aTozNjtzOjk6ImNvbXBvbmVudCI7czo2OiJjb3Vyc2UiO3M6NjoiaXRlbWlkIjtpOjA7czo4OiJmaWxlYXJlYSI7czoxMzoib3ZlcnZpZXdmaWxlcyI7czo4OiJmaWxlcGF0aCI7czoxOiIvIjtzOjg6ImZpbGVuYW1lIjtzOjk6ImhpbmgzLmpwZyI7fQ==";}', 'Admin User', 'allrightsreserved', 1436948792, 1436948796, 0, NULL),
(33, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'f2e4575213d588faed94cc1c50a22bb5af702202', 5, 'user', 'draft', 618133545, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1436958003, 1436958003, 0, NULL),
(34, '0e077f66b6cef27d52a67d952cecf41369741bfb', 'c6612f18b40981821ccdf7ce185cdb168b07465c', 5, 'user', 'draft', 965515136, '/', 'hinh4.jpg', 2, 68734, 'image/jpeg', 0, 'O:8:"stdClass":2:{s:6:"source";s:9:"hinh4.jpg";s:8:"original";s:220:"YTo2OntzOjk6ImNvbnRleHRpZCI7aTo0MTtzOjk6ImNvbXBvbmVudCI7czo2OiJjb3Vyc2UiO3M6NjoiaXRlbWlkIjtpOjA7czo4OiJmaWxlYXJlYSI7czoxMzoib3ZlcnZpZXdmaWxlcyI7czo4OiJmaWxlcGF0aCI7czoxOiIvIjtzOjg6ImZpbGVuYW1lIjtzOjk6Imhpbmg0LmpwZyI7fQ==";}', 'Admin User', 'allrightsreserved', 1436957093, 1436957107, 0, NULL),
(35, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '37a325cabf71ff15797c669e1fe31148a149beb3', 5, 'user', 'draft', 965515136, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1436958034, 1436958034, 0, NULL),
(36, '4c2618d688febcf2c5ba18ad564c105e8383429f', '66d182f02b2be2dfcf4c2b546caaf0d21c3ed408', 5, 'user', 'draft', 866485595, '/', 'hinh3.jpg', 2, 36419, 'image/jpeg', 0, 'O:8:"stdClass":1:{s:6:"source";s:9:"hinh3.jpg";}', 'Admin User', 'allrightsreserved', 1436958110, 1436958110, 0, NULL),
(37, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'df58990ee93984c5f65354ff6df4a2ee96286942', 5, 'user', 'draft', 866485595, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1436958110, 1436958110, 0, NULL),
(38, '4c2618d688febcf2c5ba18ad564c105e8383429f', '324f3b1017204efe64900253c3cdd27b46f2478e', 49, 'course', 'overviewfiles', 0, '/', 'hinh3.jpg', 2, 36419, 'image/jpeg', 0, 'hinh3.jpg', 'Admin User', 'allrightsreserved', 1436958110, 1436958115, 0, NULL),
(39, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '211fad380c508f65f5cc27d57fe99ee8d2aab957', 49, 'course', 'overviewfiles', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1436958110, 1436958115, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files_reference`
--

CREATE TABLE IF NOT EXISTS `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `reference` longtext,
  `referencehash` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_refrep_uix` (`referencehash`,`repositoryid`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store files references' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_active`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores information about which filters are active in which c' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_filter_active`
--

INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'activitynames', 1, 1, 2),
(2, 'mathjaxloader', 1, 1, 1),
(3, 'mediaplugin', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_config`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores per-context configuration settings for filters which ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_folder`
--

CREATE TABLE IF NOT EXISTS `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one folder resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_format_grid_icon`
--

CREATE TABLE IF NOT EXISTS `mdl_format_grid_icon` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `image` longtext,
  `displayedimageindex` bigint(10) NOT NULL DEFAULT '0',
  `sectionid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_formgridicon_sec_uix` (`sectionid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Icon images for each topic, used by the grid course format' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `mdl_format_grid_icon`
--

INSERT INTO `mdl_format_grid_icon` (`id`, `image`, `displayedimageindex`, `sectionid`, `courseid`) VALUES
(1, 'goi_hinh1.jpg', 1, 131, 15),
(2, 'goi_hinh2.jpg', 1, 132, 15),
(3, 'goi_hinh3.jpg', 1, 133, 15),
(4, NULL, 0, 134, 15),
(5, NULL, 0, 135, 15),
(6, NULL, 0, 136, 15),
(7, NULL, 0, 137, 15),
(8, NULL, 0, 138, 15),
(9, NULL, 0, 139, 15),
(10, NULL, 0, 140, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_format_grid_summary`
--

CREATE TABLE IF NOT EXISTS `mdl_format_grid_summary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `showsummary` tinyint(1) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='A table to hold a single flag on whether to show section 0 a' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_format_grid_summary`
--

INSERT INTO `mdl_format_grid_summary` (`id`, `showsummary`, `courseid`) VALUES
(1, 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum`
--

CREATE TABLE IF NOT EXISTS `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'general',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Forums contain and structure discussion' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_forum`
--

INSERT INTO `mdl_forum` (`id`, `course`, `type`, `name`, `intro`, `introformat`, `assessed`, `assesstimestart`, `assesstimefinish`, `scale`, `maxbytes`, `maxattachments`, `forcesubscribe`, `trackingtype`, `rsstype`, `rssarticles`, `timemodified`, `warnafter`, `blockafter`, `blockperiod`, `completiondiscussions`, `completionreplies`, `completionposts`, `displaywordcount`) VALUES
(1, 2, 'news', 'News forum', 'General news and announcements', 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1435142120, 0, 0, 0, 0, 0, 0, 0),
(2, 1, 'news', 'Site news', 'General news and announcements', 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1436924871, 0, 0, 0, 0, 0, 0, 0),
(3, 4, 'news', 'News forum', 'General news and announcements', 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1436943356, 0, 0, 0, 0, 0, 0, 0),
(4, 3, 'news', 'News forum', 'General news and announcements', 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1436948537, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_digests`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_digests` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`),
  KEY `mdl_forudige_use_ix` (`userid`),
  KEY `mdl_forudige_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of user mail delivery preferences for each forum' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_cou_ix` (`course`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Forums are composed of discussions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussion_subs`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_discussion_subs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `forum` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `discussion` bigint(10) NOT NULL,
  `preference` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudiscsubs_usedis_uix` (`userid`,`discussion`),
  KEY `mdl_forudiscsubs_for_ix` (`forum`),
  KEY `mdl_forudiscsubs_use_ix` (`userid`),
  KEY `mdl_forudiscsubs_dis_ix` (`discussion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users may choose to subscribe and unsubscribe from specific ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_posts`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='All posts are stored in this table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping track of posts that will be mailed in digest for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_read`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_posuse_ix` (`postid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users read posts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of who is subscribed to what forum' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_track_prefs`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users untracked forums' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossaries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_alias`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='entries alias' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all categories for glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) NOT NULL DEFAULT '',
  `definition` longtext NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='categories of each glossary entry' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_formats`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `popupformatname` varchar(50) NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) NOT NULL DEFAULT '',
  `defaulthook` varchar(50) NOT NULL DEFAULT '',
  `sortkey` varchar(50) NOT NULL DEFAULT '',
  `sortorder` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Setting of the display formats' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_glossary_formats`
--

INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, '', '', '', ''),
(5, 'faq', 'faq', 1, 1, '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table keeps information about categories, used for grou' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_grade_categories`
--

INSERT INTO `mdl_grade_categories` (`id`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `timecreated`, `timemodified`, `hidden`) VALUES
(1, 2, NULL, 1, '/1/', '?', 13, 0, 0, 1, 0, 1436952481, 1436952481, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='History of grade_categories' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_grade_categories_history`
--

INSERT INTO `mdl_grade_categories_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `hidden`) VALUES
(1, 1, 1, 'system', 1436952481, 2, 2, NULL, 0, NULL, '?', 13, 0, 0, 1, 0, 0, 0),
(2, 2, 1, 'system', 1436952481, 2, 2, NULL, 1, '/1/', '?', 13, 0, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `aggregationstatus` varchar(10) NOT NULL DEFAULT 'unknown',
  `aggregationweight` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='grade_grades  This table keeps individual grades for each us' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_newitem`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='temporary table for storing new grade_item names from grade ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_values`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary table for importing grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table keeps information about gradeable items (ie colum' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_grade_items`
--

INSERT INTO `mdl_grade_items` (`id`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `aggregationcoef2`, `sortorder`, `display`, `decimals`, `hidden`, `locked`, `locktime`, `needsupdate`, `weightoverride`, `timecreated`, `timemodified`) VALUES
(1, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, '100.00000', '0.00000', NULL, NULL, '0.00000', '1.00000', '0.00000', '0.00000', '0.00000', 1, 0, NULL, 0, 0, 0, 1, 0, 1436952481, 1436952481);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='History of grade_items' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_grade_items_history`
--

INSERT INTO `mdl_grade_items_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `aggregationcoef2`, `sortorder`, `hidden`, `locked`, `locktime`, `needsupdate`, `display`, `decimals`, `weightoverride`) VALUES
(1, 1, 1, 'system', 1436952481, 2, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, '100.00000', '0.00000', NULL, NULL, '0.00000', '1.00000', '0.00000', '0.00000', '0.00000', 1, 0, 0, 0, 1, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_letters`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Repository for grade letters, for courses and other moodle e' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table describes the outcomes used in the system. An out' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores what outcomes are used in what courses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='gradebook settings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='frequently used comments used in marking guide' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the criteria grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the guide is filled by a particular r' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the rubric is filled by a particular ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the columns of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_areas`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `areaname` varchar(100) NOT NULL DEFAULT '',
  `activemethod` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies gradable areas where advanced grading can happen.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the basic information about an advanced grading for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading form instance is an assessment record for one gradab' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A grouping is a collection of groups. WAS: groups_groupings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a grouping to a group (note, groups can be in multiple ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(254) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups_members`
--

CREATE TABLE IF NOT EXISTS `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_imscp`
--

CREATE TABLE IF NOT EXISTS `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one imscp resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_label`
--

CREATE TABLE IF NOT EXISTS `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines labels' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext NOT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `highscores` smallint(3) NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionendreached` tinyint(1) DEFAULT '0',
  `completiontimespent` bigint(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_answers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_attempts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_branch`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='branches for each lesson/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_high_scores`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_high_scores` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `nickname` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_lesshighscor_use_ix` (`userid`),
  KEY `mdl_lesshighscor_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='high scores for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_overrides`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `available` bigint(10) DEFAULT NULL,
  `deadline` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `review` smallint(3) DEFAULT NULL,
  `maxattempts` smallint(3) DEFAULT NULL,
  `retake` smallint(3) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_lessover_les_ix` (`lessonid`),
  KEY `mdl_lessover_gro_ix` (`groupid`),
  KEY `mdl_lessover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to lesson settings.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `contents` longtext NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_timer`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lesson timer for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_license`
--

CREATE TABLE IF NOT EXISTS `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) DEFAULT NULL,
  `fullname` longtext,
  `source` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='store licenses used by moodle' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_license`
--

INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nc/3.0/', 1, 2013051500),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lock_db`
--

CREATE TABLE IF NOT EXISTS `mdl_lock_db` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `resourcekey` varchar(255) NOT NULL DEFAULT '',
  `expires` bigint(10) DEFAULT NULL,
  `owner` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_lockdb_res_uix` (`resourcekey`),
  KEY `mdl_lockdb_exp_ix` (`expires`),
  KEY `mdl_lockdb_own_ix` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores active and inactive lock types for db locking method.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log`
--

CREATE TABLE IF NOT EXISTS `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Every action is logged as far as possible' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_logstore_standard_log`
--

CREATE TABLE IF NOT EXISTS `mdl_logstore_standard_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(255) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  `action` varchar(100) NOT NULL DEFAULT '',
  `target` varchar(100) NOT NULL DEFAULT '',
  `objecttable` varchar(50) DEFAULT NULL,
  `objectid` bigint(10) DEFAULT NULL,
  `crud` varchar(1) NOT NULL DEFAULT '',
  `edulevel` tinyint(1) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `relateduserid` bigint(10) DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `other` longtext,
  `timecreated` bigint(10) NOT NULL,
  `origin` varchar(10) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `realuserid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_logsstanlog_tim_ix` (`timecreated`),
  KEY `mdl_logsstanlog_couanotim_ix` (`courseid`,`anonymous`,`timecreated`),
  KEY `mdl_logsstanlog_useconconcr_ix` (`userid`,`contextlevel`,`contextinstanceid`,`crud`,`edulevel`,`timecreated`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Standard log table' AUTO_INCREMENT=297 ;

--
-- Dumping data for table `mdl_logstore_standard_log`
--

INSERT INTO `mdl_logstore_standard_log` (`id`, `eventname`, `component`, `action`, `target`, `objecttable`, `objectid`, `crud`, `edulevel`, `contextid`, `contextlevel`, `contextinstanceid`, `userid`, `courseid`, `relateduserid`, `anonymous`, `other`, `timecreated`, `origin`, `ip`, `realuserid`) VALUES
(1, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1435054830, 'web', '0:0:0:0:0:0:0:1', NULL),
(2, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 5, 30, 2, 2, 0, 2, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1435055102, 'web', '0:0:0:0:0:0:0:1', NULL),
(3, '\\core\\event\\user_updated', 'core', 'updated', 'user', 'user', 2, 'u', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1435055102, 'web', '0:0:0:0:0:0:0:1', NULL),
(4, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435060018, 'web', '0:0:0:0:0:0:0:1', NULL),
(5, '\\core\\event\\user_list_viewed', 'core', 'viewed', 'user_list', 'course', 1, 'r', 0, 2, 50, 1, 2, 1, NULL, 0, 'a:2:{s:15:"courseshortname";s:9:"Elearning";s:14:"coursefullname";s:9:"Elearning";}', 1435060030, 'web', '0:0:0:0:0:0:0:1', NULL),
(6, '\\core\\event\\blog_entries_viewed', 'core', 'viewed', 'blog_entries', NULL, NULL, 'r', 2, 1, 10, 0, 2, 0, NULL, 0, 'a:8:{s:7:"entryid";N;s:5:"tagid";N;s:6:"userid";N;s:5:"modid";N;s:7:"groupid";N;s:6:"search";N;s:9:"fromstart";i:0;s:8:"courseid";i:0;}', 1435060037, 'web', '0:0:0:0:0:0:0:1', NULL),
(7, '\\core\\event\\notes_viewed', 'core', 'viewed', 'notes', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, 0, 0, 'N;', 1435060115, 'web', '0:0:0:0:0:0:0:1', NULL),
(8, '\\core\\event\\notes_viewed', 'core', 'viewed', 'notes', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, 0, 0, 'N;', 1435060116, 'web', '0:0:0:0:0:0:0:1', NULL),
(9, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435060285, 'web', '0:0:0:0:0:0:0:1', NULL),
(10, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1435114554, 'web', '0:0:0:0:0:0:0:1', NULL),
(11, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1435114560, 'web', '0:0:0:0:0:0:0:1', NULL),
(12, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1435118906, 'web', '0:0:0:0:0:0:0:1', NULL),
(13, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1435118922, 'web', '0:0:0:0:0:0:0:1', NULL),
(14, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1435125663, 'web', '0:0:0:0:0:0:0:1', NULL),
(15, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1435125686, 'web', '0:0:0:0:0:0:0:1', NULL),
(16, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1435127224, 'web', '0:0:0:0:0:0:0:1', NULL),
(17, '\\core\\event\\user_login_failed', 'core', 'failed', 'user_login', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:2:{s:8:"username";s:5:"admin";s:6:"reason";i:3;}', 1435127255, 'web', '0:0:0:0:0:0:0:1', NULL),
(18, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 5, 30, 2, 0, 0, 2, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1435130895, 'web', '0:0:0:0:0:0:0:1', NULL),
(19, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 5, 30, 2, 0, 0, 2, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1435130895, 'web', '0:0:0:0:0:0:0:1', NULL),
(20, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1435130896, 'web', '0:0:0:0:0:0:0:1', NULL),
(21, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435130938, 'web', '0:0:0:0:0:0:0:1', NULL),
(22, '\\core\\event\\course_category_created', 'core', 'created', 'course_category', 'course_categories', 2, 'c', 0, 26, 40, 2, 2, 0, NULL, 0, 'N;', 1435141738, 'web', '0:0:0:0:0:0:0:1', NULL),
(23, '\\core\\event\\course_created', 'core', 'created', 'course', 'course', 2, 'c', 1, 27, 50, 2, 2, 2, NULL, 0, 'a:2:{s:9:"shortname";s:5:"K2014";s:8:"fullname";s:5:"K2014";}', 1435141852, 'web', '0:0:0:0:0:0:0:1', NULL),
(24, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435142077, 'web', '0:0:0:0:0:0:0:1', NULL),
(25, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 27, 50, 2, 2, 2, NULL, 0, 'N;', 1435142125, 'web', '0:0:0:0:0:0:0:1', NULL),
(26, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143061, 'web', '0:0:0:0:0:0:0:1', NULL),
(27, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143251, 'web', '0:0:0:0:0:0:0:1', NULL),
(28, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143293, 'web', '0:0:0:0:0:0:0:1', NULL),
(29, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143329, 'web', '0:0:0:0:0:0:0:1', NULL),
(30, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143344, 'web', '0:0:0:0:0:0:0:1', NULL),
(31, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143374, 'web', '0:0:0:0:0:0:0:1', NULL),
(32, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143453, 'web', '0:0:0:0:0:0:0:1', NULL),
(33, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143586, 'web', '0:0:0:0:0:0:0:1', NULL),
(34, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143603, 'web', '0:0:0:0:0:0:0:1', NULL),
(35, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143658, 'web', '0:0:0:0:0:0:0:1', NULL),
(36, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143722, 'web', '0:0:0:0:0:0:0:1', NULL),
(37, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143775, 'web', '0:0:0:0:0:0:0:1', NULL),
(38, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143803, 'web', '0:0:0:0:0:0:0:1', NULL),
(39, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143859, 'web', '0:0:0:0:0:0:0:1', NULL),
(40, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435143926, 'web', '0:0:0:0:0:0:0:1', NULL),
(41, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1435144326, 'web', '0:0:0:0:0:0:0:1', NULL),
(42, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1435144368, 'web', '0:0:0:0:0:0:0:1', NULL),
(43, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 27, 50, 2, 2, 2, NULL, 0, 'N;', 1435144373, 'web', '0:0:0:0:0:0:0:1', NULL),
(44, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435149108, 'web', '0:0:0:0:0:0:0:1', NULL),
(45, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435149155, 'web', '0:0:0:0:0:0:0:1', NULL),
(46, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435149161, 'web', '0:0:0:0:0:0:0:1', NULL),
(47, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435149175, 'web', '0:0:0:0:0:0:0:1', NULL),
(48, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435149183, 'web', '0:0:0:0:0:0:0:1', NULL),
(49, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435149528, 'web', '0:0:0:0:0:0:0:1', NULL),
(50, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435149580, 'web', '0:0:0:0:0:0:0:1', NULL),
(51, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435149586, 'web', '0:0:0:0:0:0:0:1', NULL),
(52, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1435149601, 'web', '0:0:0:0:0:0:0:1', NULL),
(53, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1436876855, 'web', '0:0:0:0:0:0:0:1', NULL),
(54, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1436924860, 'web', '0:0:0:0:0:0:0:1', NULL),
(55, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1436925111, 'web', '0:0:0:0:0:0:0:1', NULL),
(56, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1436925145, 'web', '0:0:0:0:0:0:0:1', NULL),
(57, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1436925185, 'web', '0:0:0:0:0:0:0:1', NULL),
(58, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1436925242, 'web', '0:0:0:0:0:0:0:1', NULL),
(59, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436925627, 'web', '0:0:0:0:0:0:0:1', NULL),
(60, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436925636, 'web', '0:0:0:0:0:0:0:1', NULL),
(61, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436925793, 'web', '0:0:0:0:0:0:0:1', NULL),
(62, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436925841, 'web', '0:0:0:0:0:0:0:1', NULL),
(63, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436925867, 'web', '0:0:0:0:0:0:0:1', NULL),
(64, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436925869, 'web', '0:0:0:0:0:0:0:1', NULL),
(65, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436926050, 'web', '0:0:0:0:0:0:0:1', NULL),
(66, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436926054, 'web', '0:0:0:0:0:0:0:1', NULL),
(67, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436926057, 'web', '0:0:0:0:0:0:0:1', NULL),
(68, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436926060, 'web', '0:0:0:0:0:0:0:1', NULL),
(69, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436926062, 'web', '0:0:0:0:0:0:0:1', NULL),
(70, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436926065, 'web', '0:0:0:0:0:0:0:1', NULL),
(71, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436927303, 'web', '0:0:0:0:0:0:0:1', NULL),
(72, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436927312, 'web', '0:0:0:0:0:0:0:1', NULL),
(73, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436927322, 'web', '0:0:0:0:0:0:0:1', NULL),
(74, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436927333, 'web', '0:0:0:0:0:0:0:1', NULL),
(75, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436927429, 'web', '0:0:0:0:0:0:0:1', NULL),
(76, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436927456, 'web', '0:0:0:0:0:0:0:1', NULL),
(77, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436927621, 'web', '0:0:0:0:0:0:0:1', NULL),
(78, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436927628, 'web', '0:0:0:0:0:0:0:1', NULL),
(79, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436927661, 'web', '0:0:0:0:0:0:0:1', NULL),
(80, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436927701, 'web', '0:0:0:0:0:0:0:1', NULL),
(81, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436927760, 'web', '0:0:0:0:0:0:0:1', NULL),
(82, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436927775, 'web', '0:0:0:0:0:0:0:1', NULL),
(83, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929013, 'web', '0:0:0:0:0:0:0:1', NULL),
(84, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929050, 'web', '0:0:0:0:0:0:0:1', NULL),
(85, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929063, 'web', '0:0:0:0:0:0:0:1', NULL),
(86, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929073, 'web', '0:0:0:0:0:0:0:1', NULL),
(87, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929091, 'web', '0:0:0:0:0:0:0:1', NULL),
(88, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929125, 'web', '0:0:0:0:0:0:0:1', NULL),
(89, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929158, 'web', '0:0:0:0:0:0:0:1', NULL),
(90, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929337, 'web', '0:0:0:0:0:0:0:1', NULL),
(91, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929359, 'web', '0:0:0:0:0:0:0:1', NULL),
(92, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929564, 'web', '0:0:0:0:0:0:0:1', NULL),
(93, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929649, 'web', '0:0:0:0:0:0:0:1', NULL),
(94, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929688, 'web', '0:0:0:0:0:0:0:1', NULL),
(95, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 27, 50, 2, 2, 2, NULL, 0, 'N;', 1436929725, 'web', '0:0:0:0:0:0:0:1', NULL),
(96, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929742, 'web', '0:0:0:0:0:0:0:1', NULL),
(97, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929789, 'web', '0:0:0:0:0:0:0:1', NULL),
(98, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929797, 'web', '0:0:0:0:0:0:0:1', NULL),
(99, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929805, 'web', '0:0:0:0:0:0:0:1', NULL),
(100, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929812, 'web', '0:0:0:0:0:0:0:1', NULL),
(101, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 27, 50, 2, 2, 2, NULL, 0, 'N;', 1436929823, 'web', '0:0:0:0:0:0:0:1', NULL),
(102, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929827, 'web', '0:0:0:0:0:0:0:1', NULL),
(103, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929932, 'web', '0:0:0:0:0:0:0:1', NULL),
(104, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436929986, 'web', '0:0:0:0:0:0:0:1', NULL),
(105, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 27, 50, 2, 2, 2, NULL, 0, 'N;', 1436930139, 'web', '0:0:0:0:0:0:0:1', NULL),
(106, '\\core\\event\\course_updated', 'core', 'updated', 'course', 'course', 2, 'u', 1, 27, 50, 2, 2, 2, NULL, 0, 'a:2:{s:9:"shortname";s:5:"K2014";s:8:"fullname";s:5:"K2014";}', 1436930178, 'web', '0:0:0:0:0:0:0:1', NULL),
(107, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 27, 50, 2, 2, 2, NULL, 0, 'N;', 1436930183, 'web', '0:0:0:0:0:0:0:1', NULL),
(108, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436930195, 'web', '0:0:0:0:0:0:0:1', NULL),
(109, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436930812, 'web', '0:0:0:0:0:0:0:1', NULL),
(110, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436930814, 'web', '0:0:0:0:0:0:0:1', NULL),
(111, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436930827, 'web', '0:0:0:0:0:0:0:1', NULL),
(112, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436930852, 'web', '0:0:0:0:0:0:0:1', NULL),
(113, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436930951, 'web', '0:0:0:0:0:0:0:1', NULL),
(114, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436931260, 'web', '0:0:0:0:0:0:0:1', NULL),
(115, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436931311, 'web', '0:0:0:0:0:0:0:1', NULL),
(116, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436931370, 'web', '0:0:0:0:0:0:0:1', NULL),
(117, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436931534, 'web', '0:0:0:0:0:0:0:1', NULL),
(118, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436931564, 'web', '0:0:0:0:0:0:0:1', NULL),
(119, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436932612, 'web', '0:0:0:0:0:0:0:1', NULL),
(120, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436932614, 'web', '0:0:0:0:0:0:0:1', NULL),
(121, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436932663, 'web', '0:0:0:0:0:0:0:1', NULL),
(122, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436932678, 'web', '0:0:0:0:0:0:0:1', NULL),
(123, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436932690, 'web', '0:0:0:0:0:0:0:1', NULL),
(124, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 27, 50, 2, 2, 2, NULL, 0, 'N;', 1436932987, 'web', '0:0:0:0:0:0:0:1', NULL),
(125, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436932992, 'web', '0:0:0:0:0:0:0:1', NULL),
(126, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436933067, 'web', '0:0:0:0:0:0:0:1', NULL),
(127, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436933081, 'web', '0:0:0:0:0:0:0:1', NULL),
(128, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436934116, 'web', '0:0:0:0:0:0:0:1', NULL),
(129, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436934120, 'web', '0:0:0:0:0:0:0:1', NULL),
(130, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436934123, 'web', '0:0:0:0:0:0:0:1', NULL),
(131, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436934126, 'web', '0:0:0:0:0:0:0:1', NULL),
(132, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436934129, 'web', '0:0:0:0:0:0:0:1', NULL),
(133, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436934133, 'web', '0:0:0:0:0:0:0:1', NULL),
(134, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436934389, 'web', '0:0:0:0:0:0:0:1', NULL),
(135, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436934615, 'web', '0:0:0:0:0:0:0:1', NULL),
(136, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436934742, 'web', '0:0:0:0:0:0:0:1', NULL),
(137, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436934919, 'web', '0:0:0:0:0:0:0:1', NULL),
(138, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436934952, 'web', '0:0:0:0:0:0:0:1', NULL),
(139, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436934988, 'web', '0:0:0:0:0:0:0:1', NULL),
(140, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935084, 'web', '0:0:0:0:0:0:0:1', NULL),
(141, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935110, 'web', '0:0:0:0:0:0:0:1', NULL),
(142, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935136, 'web', '0:0:0:0:0:0:0:1', NULL),
(143, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935167, 'web', '0:0:0:0:0:0:0:1', NULL),
(144, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935207, 'web', '0:0:0:0:0:0:0:1', NULL),
(145, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935353, 'web', '0:0:0:0:0:0:0:1', NULL),
(146, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935364, 'web', '0:0:0:0:0:0:0:1', NULL),
(147, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935624, 'web', '0:0:0:0:0:0:0:1', NULL),
(148, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935666, 'web', '0:0:0:0:0:0:0:1', NULL),
(149, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935702, 'web', '0:0:0:0:0:0:0:1', NULL),
(150, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935720, 'web', '0:0:0:0:0:0:0:1', NULL),
(151, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935767, 'web', '0:0:0:0:0:0:0:1', NULL),
(152, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935788, 'web', '0:0:0:0:0:0:0:1', NULL),
(153, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935831, 'web', '0:0:0:0:0:0:0:1', NULL),
(154, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935942, 'web', '0:0:0:0:0:0:0:1', NULL),
(155, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436935988, 'web', '0:0:0:0:0:0:0:1', NULL),
(156, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436936568, 'web', '0:0:0:0:0:0:0:1', NULL),
(157, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436938765, 'web', '0:0:0:0:0:0:0:1', NULL),
(158, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436938804, 'web', '0:0:0:0:0:0:0:1', NULL),
(159, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436938814, 'web', '0:0:0:0:0:0:0:1', NULL),
(160, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436938865, 'web', '0:0:0:0:0:0:0:1', NULL),
(161, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436939002, 'web', '0:0:0:0:0:0:0:1', NULL),
(162, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436939307, 'web', '0:0:0:0:0:0:0:1', NULL),
(163, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436939351, 'web', '0:0:0:0:0:0:0:1', NULL),
(164, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436939379, 'web', '0:0:0:0:0:0:0:1', NULL),
(165, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436939585, 'web', '0:0:0:0:0:0:0:1', NULL),
(166, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436939678, 'web', '0:0:0:0:0:0:0:1', NULL),
(167, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436939685, 'web', '0:0:0:0:0:0:0:1', NULL),
(168, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436940597, 'web', '0:0:0:0:0:0:0:1', NULL),
(169, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436940804, 'web', '0:0:0:0:0:0:0:1', NULL),
(170, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436940815, 'web', '0:0:0:0:0:0:0:1', NULL),
(171, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436940941, 'web', '0:0:0:0:0:0:0:1', NULL),
(172, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941018, 'web', '0:0:0:0:0:0:0:1', NULL),
(173, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941060, 'web', '0:0:0:0:0:0:0:1', NULL),
(174, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941066, 'web', '0:0:0:0:0:0:0:1', NULL),
(175, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941079, 'web', '0:0:0:0:0:0:0:1', NULL),
(176, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941116, 'web', '0:0:0:0:0:0:0:1', NULL),
(177, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941163, 'web', '0:0:0:0:0:0:0:1', NULL),
(178, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941199, 'web', '0:0:0:0:0:0:0:1', NULL),
(179, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941233, 'web', '0:0:0:0:0:0:0:1', NULL),
(180, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941271, 'web', '0:0:0:0:0:0:0:1', NULL),
(181, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941466, 'web', '0:0:0:0:0:0:0:1', NULL),
(182, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941512, 'web', '0:0:0:0:0:0:0:1', NULL),
(183, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941682, 'web', '0:0:0:0:0:0:0:1', NULL),
(184, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941697, 'web', '0:0:0:0:0:0:0:1', NULL),
(185, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941710, 'web', '0:0:0:0:0:0:0:1', NULL),
(186, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941736, 'web', '0:0:0:0:0:0:0:1', NULL),
(187, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436941930, 'web', '0:0:0:0:0:0:0:1', NULL),
(188, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436942032, 'web', '0:0:0:0:0:0:0:1', NULL),
(189, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436942102, 'web', '0:0:0:0:0:0:0:1', NULL),
(190, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436942133, 'web', '0:0:0:0:0:0:0:1', NULL),
(191, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436942188, 'web', '0:0:0:0:0:0:0:1', NULL),
(192, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436942283, 'web', '0:0:0:0:0:0:0:1', NULL),
(193, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436942303, 'web', '0:0:0:0:0:0:0:1', NULL),
(194, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436942325, 'web', '0:0:0:0:0:0:0:1', NULL),
(195, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436942451, 'web', '0:0:0:0:0:0:0:1', NULL),
(196, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436942827, 'web', '0:0:0:0:0:0:0:1', NULL),
(197, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436942862, 'web', '0:0:0:0:0:0:0:1', NULL),
(198, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436942888, 'web', '0:0:0:0:0:0:0:1', NULL),
(199, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436942900, 'web', '0:0:0:0:0:0:0:1', NULL),
(200, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436943070, 'web', '0:0:0:0:0:0:0:1', NULL),
(201, '\\core\\event\\course_created', 'core', 'created', 'course', 'course', 3, 'c', 1, 36, 50, 3, 2, 3, NULL, 0, 'a:2:{s:9:"shortname";s:5:"K2015";s:8:"fullname";s:5:"K2015";}', 1436943142, 'web', '0:0:0:0:0:0:0:1', NULL),
(202, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436943150, 'web', '0:0:0:0:0:0:0:1', NULL),
(203, '\\core\\event\\course_created', 'core', 'created', 'course', 'course', 4, 'c', 1, 41, 50, 4, 2, 4, NULL, 0, 'a:2:{s:9:"shortname";s:5:"K2016";s:8:"fullname";s:5:"K2016";}', 1436943295, 'web', '0:0:0:0:0:0:0:1', NULL),
(204, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436943305, 'web', '0:0:0:0:0:0:0:1', NULL),
(205, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 41, 50, 4, 2, 4, NULL, 0, 'N;', 1436943358, 'web', '0:0:0:0:0:0:0:1', NULL),
(206, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436943389, 'web', '0:0:0:0:0:0:0:1', NULL),
(207, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436943403, 'web', '0:0:0:0:0:0:0:1', NULL),
(208, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436943466, 'web', '0:0:0:0:0:0:0:1', NULL),
(209, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436943550, 'web', '0:0:0:0:0:0:0:1', NULL),
(210, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436944075, 'web', '0:0:0:0:0:0:0:1', NULL),
(211, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436944114, 'web', '0:0:0:0:0:0:0:1', NULL),
(212, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436944141, 'web', '0:0:0:0:0:0:0:1', NULL),
(213, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436944179, 'web', '0:0:0:0:0:0:0:1', NULL),
(214, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436944189, 'web', '0:0:0:0:0:0:0:1', NULL),
(215, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436945332, 'web', '0:0:0:0:0:0:0:1', NULL),
(216, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436945773, 'web', '0:0:0:0:0:0:0:1', NULL),
(217, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436945817, 'web', '0:0:0:0:0:0:0:1', NULL),
(218, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436945838, 'web', '0:0:0:0:0:0:0:1', NULL),
(219, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436945853, 'web', '0:0:0:0:0:0:0:1', NULL),
(220, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436945893, 'web', '0:0:0:0:0:0:0:1', NULL),
(221, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436945930, 'web', '0:0:0:0:0:0:0:1', NULL),
(222, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436945945, 'web', '0:0:0:0:0:0:0:1', NULL),
(223, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436945962, 'web', '0:0:0:0:0:0:0:1', NULL),
(224, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436946063, 'web', '0:0:0:0:0:0:0:1', NULL),
(225, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436946151, 'web', '0:0:0:0:0:0:0:1', NULL),
(226, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436946185, 'web', '0:0:0:0:0:0:0:1', NULL),
(227, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436946222, 'web', '0:0:0:0:0:0:0:1', NULL),
(228, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436946269, 'web', '0:0:0:0:0:0:0:1', NULL),
(229, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436946311, 'web', '0:0:0:0:0:0:0:1', NULL),
(230, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436946343, 'web', '0:0:0:0:0:0:0:1', NULL),
(231, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436946372, 'web', '0:0:0:0:0:0:0:1', NULL),
(232, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436946697, 'web', '0:0:0:0:0:0:0:1', NULL),
(233, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436946701, 'web', '0:0:0:0:0:0:0:1', NULL),
(234, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436946704, 'web', '0:0:0:0:0:0:0:1', NULL),
(235, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436946802, 'web', '0:0:0:0:0:0:0:1', NULL),
(236, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436946860, 'web', '0:0:0:0:0:0:0:1', NULL),
(237, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436946990, 'web', '0:0:0:0:0:0:0:1', NULL),
(238, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436947017, 'web', '0:0:0:0:0:0:0:1', NULL),
(239, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 27, 50, 2, 2, 2, NULL, 0, 'N;', 1436948536, 'web', '0:0:0:0:0:0:0:1', NULL),
(240, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 2, 3, NULL, 0, 'N;', 1436948539, 'web', '0:0:0:0:0:0:0:1', NULL),
(241, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 41, 50, 4, 2, 4, NULL, 0, 'N;', 1436948541, 'web', '0:0:0:0:0:0:0:1', NULL),
(242, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 2, 3, NULL, 0, 'N;', 1436948543, 'web', '0:0:0:0:0:0:0:1', NULL),
(243, '\\core\\event\\course_updated', 'core', 'updated', 'course', 'course', 3, 'u', 1, 36, 50, 3, 2, 3, NULL, 0, 'a:2:{s:9:"shortname";s:5:"K2015";s:8:"fullname";s:5:"K2015";}', 1436948797, 'web', '0:0:0:0:0:0:0:1', NULL),
(244, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 36, 50, 3, 2, 3, NULL, 0, 'N;', 1436948799, 'web', '0:0:0:0:0:0:0:1', NULL),
(245, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436948804, 'web', '0:0:0:0:0:0:0:1', NULL),
(246, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 27, 50, 2, 2, 2, NULL, 0, 'N;', 1436952458, 'web', '0:0:0:0:0:0:0:1', NULL),
(247, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 27, 50, 2, 2, 2, NULL, 0, 'N;', 1436952471, 'web', '0:0:0:0:0:0:0:1', NULL),
(248, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436952520, 'web', '0:0:0:0:0:0:0:1', NULL),
(249, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436954680, 'web', '0:0:0:0:0:0:0:1', NULL),
(250, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436954682, 'web', '0:0:0:0:0:0:0:1', NULL),
(251, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436954749, 'web', '0:0:0:0:0:0:0:1', NULL),
(252, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436954783, 'web', '0:0:0:0:0:0:0:1', NULL),
(253, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436955068, 'web', '0:0:0:0:0:0:0:1', NULL),
(254, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436955308, 'web', '0:0:0:0:0:0:0:1', NULL),
(255, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436955340, 'web', '0:0:0:0:0:0:0:1', NULL),
(256, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436955728, 'web', '0:0:0:0:0:0:0:1', NULL),
(257, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436955734, 'web', '0:0:0:0:0:0:0:1', NULL),
(258, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436955753, 'web', '0:0:0:0:0:0:0:1', NULL),
(259, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436955808, 'web', '0:0:0:0:0:0:0:1', NULL),
(260, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436956050, 'web', '0:0:0:0:0:0:0:1', NULL),
(261, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436956175, 'web', '0:0:0:0:0:0:0:1', NULL),
(262, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436956208, 'web', '0:0:0:0:0:0:0:1', NULL),
(263, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436956237, 'web', '0:0:0:0:0:0:0:1', NULL),
(264, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436956354, 'web', '0:0:0:0:0:0:0:1', NULL),
(265, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436956366, 'web', '0:0:0:0:0:0:0:1', NULL),
(266, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436956618, 'web', '0:0:0:0:0:0:0:1', NULL),
(267, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436956685, 'web', '0:0:0:0:0:0:0:1', NULL),
(268, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436956775, 'web', '0:0:0:0:0:0:0:1', NULL),
(269, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436956881, 'web', '0:0:0:0:0:0:0:1', NULL),
(270, '\\core\\event\\course_updated', 'core', 'updated', 'course', 'course', 4, 'u', 1, 41, 50, 4, 2, 4, NULL, 0, 'a:2:{s:9:"shortname";s:5:"K2016";s:8:"fullname";s:5:"K2016";}', 1436957108, 'web', '0:0:0:0:0:0:0:1', NULL),
(271, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957116, 'web', '0:0:0:0:0:0:0:1', NULL),
(272, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957120, 'web', '0:0:0:0:0:0:0:1', NULL),
(273, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957140, 'web', '0:0:0:0:0:0:0:1', NULL),
(274, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957144, 'web', '0:0:0:0:0:0:0:1', NULL),
(275, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957150, 'web', '0:0:0:0:0:0:0:1', NULL),
(276, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957161, 'web', '0:0:0:0:0:0:0:1', NULL),
(277, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957182, 'web', '0:0:0:0:0:0:0:1', NULL),
(278, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957195, 'web', '0:0:0:0:0:0:0:1', NULL),
(279, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957305, 'web', '0:0:0:0:0:0:0:1', NULL),
(280, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957322, 'web', '0:0:0:0:0:0:0:1', NULL),
(281, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957333, 'web', '0:0:0:0:0:0:0:1', NULL),
(282, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957352, 'web', '0:0:0:0:0:0:0:1', NULL),
(283, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957373, 'web', '0:0:0:0:0:0:0:1', NULL),
(284, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957485, 'web', '0:0:0:0:0:0:0:1', NULL),
(285, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957496, 'web', '0:0:0:0:0:0:0:1', NULL),
(286, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957526, 'web', '0:0:0:0:0:0:0:1', NULL),
(287, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957539, 'web', '0:0:0:0:0:0:0:1', NULL),
(288, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957550, 'web', '0:0:0:0:0:0:0:1', NULL),
(289, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957579, 'web', '0:0:0:0:0:0:0:1', NULL),
(290, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957670, 'web', '0:0:0:0:0:0:0:1', NULL),
(291, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436957704, 'web', '0:0:0:0:0:0:0:1', NULL),
(292, '\\core\\event\\course_updated', 'core', 'updated', 'course', 'course', 2, 'u', 1, 27, 50, 2, 2, 2, NULL, 0, 'a:2:{s:9:"shortname";s:10:"LTPHP - CB";s:8:"fullname";s:27:"Lập Trình PHP Căn Bản";}', 1436957995, 'web', '0:0:0:0:0:0:0:1', NULL),
(293, '\\core\\event\\course_updated', 'core', 'updated', 'course', 'course', 3, 'u', 1, 36, 50, 3, 2, 3, NULL, 0, 'a:2:{s:9:"shortname";s:10:"LTPHP - NC";s:8:"fullname";s:26:"Lập Trình PHP Nâng Cao";}', 1436958026, 'web', '0:0:0:0:0:0:0:1', NULL),
(294, '\\core\\event\\course_updated', 'core', 'updated', 'course', 'course', 4, 'u', 1, 41, 50, 4, 2, 4, NULL, 0, 'a:2:{s:9:"shortname";s:3:"LTW";s:8:"fullname";s:20:"Lập Trình WinDown";}', 1436958063, 'web', '0:0:0:0:0:0:0:1', NULL),
(295, '\\core\\event\\course_created', 'core', 'created', 'course', 'course', 5, 'c', 1, 49, 50, 5, 2, 5, NULL, 0, 'a:2:{s:9:"shortname";s:5:"LTASP";s:8:"fullname";s:20:"Lập Trình ASP.NET";}', 1436958116, 'web', '0:0:0:0:0:0:0:1', NULL),
(296, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1436958124, 'web', '0:0:0:0:0:0:0:1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_display`
--

CREATE TABLE IF NOT EXISTS `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(40) NOT NULL DEFAULT '',
  `mtable` varchar(30) NOT NULL DEFAULT '',
  `field` varchar(200) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='For a particular module/action, specifies a moodle table/fie' AUTO_INCREMENT=188 ;

--
-- Dumping data for table `mdl_log_display`
--

INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'course', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(2, 'course', 'view', 'course', 'fullname', 'moodle'),
(3, 'course', 'view section', 'course_sections', 'name', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'hide', 'course', 'fullname', 'moodle'),
(6, 'course', 'show', 'course', 'fullname', 'moodle'),
(7, 'course', 'move', 'course', 'fullname', 'moodle'),
(8, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(9, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(10, 'course', 'report log', 'course', 'fullname', 'moodle'),
(11, 'course', 'report live', 'course', 'fullname', 'moodle'),
(12, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(13, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(14, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(15, 'category', 'add', 'course_categories', 'name', 'moodle'),
(16, 'category', 'hide', 'course_categories', 'name', 'moodle'),
(17, 'category', 'move', 'course_categories', 'name', 'moodle'),
(18, 'category', 'show', 'course_categories', 'name', 'moodle'),
(19, 'category', 'update', 'course_categories', 'name', 'moodle'),
(20, 'message', 'write', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(21, 'message', 'read', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(22, 'message', 'add contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(23, 'message', 'remove contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(24, 'message', 'block contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(25, 'message', 'unblock contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(26, 'group', 'view', 'groups', 'name', 'moodle'),
(27, 'tag', 'update', 'tag', 'name', 'moodle'),
(28, 'tag', 'flag', 'tag', 'name', 'moodle'),
(29, 'user', 'view', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(30, 'assign', 'add', 'assign', 'name', 'mod_assign'),
(31, 'assign', 'delete mod', 'assign', 'name', 'mod_assign'),
(32, 'assign', 'download all submissions', 'assign', 'name', 'mod_assign'),
(33, 'assign', 'grade submission', 'assign', 'name', 'mod_assign'),
(34, 'assign', 'lock submission', 'assign', 'name', 'mod_assign'),
(35, 'assign', 'reveal identities', 'assign', 'name', 'mod_assign'),
(36, 'assign', 'revert submission to draft', 'assign', 'name', 'mod_assign'),
(37, 'assign', 'set marking workflow state', 'assign', 'name', 'mod_assign'),
(38, 'assign', 'submission statement accepted', 'assign', 'name', 'mod_assign'),
(39, 'assign', 'submit', 'assign', 'name', 'mod_assign'),
(40, 'assign', 'submit for grading', 'assign', 'name', 'mod_assign'),
(41, 'assign', 'unlock submission', 'assign', 'name', 'mod_assign'),
(42, 'assign', 'update', 'assign', 'name', 'mod_assign'),
(43, 'assign', 'upload', 'assign', 'name', 'mod_assign'),
(44, 'assign', 'view', 'assign', 'name', 'mod_assign'),
(45, 'assign', 'view all', 'course', 'fullname', 'mod_assign'),
(46, 'assign', 'view confirm submit assignment form', 'assign', 'name', 'mod_assign'),
(47, 'assign', 'view grading form', 'assign', 'name', 'mod_assign'),
(48, 'assign', 'view submission', 'assign', 'name', 'mod_assign'),
(49, 'assign', 'view submission grading table', 'assign', 'name', 'mod_assign'),
(50, 'assign', 'view submit assignment form', 'assign', 'name', 'mod_assign'),
(51, 'assign', 'view feedback', 'assign', 'name', 'mod_assign'),
(52, 'assign', 'view batch set marking workflow state', 'assign', 'name', 'mod_assign'),
(53, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(54, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(55, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(56, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(57, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(58, 'book', 'add', 'book', 'name', 'mod_book'),
(59, 'book', 'update', 'book', 'name', 'mod_book'),
(60, 'book', 'view', 'book', 'name', 'mod_book'),
(61, 'book', 'add chapter', 'book_chapters', 'title', 'mod_book'),
(62, 'book', 'update chapter', 'book_chapters', 'title', 'mod_book'),
(63, 'book', 'view chapter', 'book_chapters', 'title', 'mod_book'),
(64, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(65, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(66, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(67, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(68, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(69, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(70, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(71, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(72, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(73, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(74, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(75, 'data', 'view', 'data', 'name', 'mod_data'),
(76, 'data', 'add', 'data', 'name', 'mod_data'),
(77, 'data', 'update', 'data', 'name', 'mod_data'),
(78, 'data', 'record delete', 'data', 'name', 'mod_data'),
(79, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(80, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(81, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(82, 'data', 'templates def', 'data', 'name', 'mod_data'),
(83, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(84, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(85, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(86, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(87, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(88, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(89, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(90, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(91, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(92, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(93, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(94, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(95, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(96, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(97, 'forum', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'mod_forum'),
(98, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(99, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(100, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(101, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(102, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(103, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(104, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(105, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(106, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(107, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(108, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(109, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(110, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(111, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(112, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(113, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(114, 'glossary', 'disapprove entry', 'glossary', 'name', 'mod_glossary'),
(115, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(116, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(117, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(118, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(119, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(120, 'label', 'add', 'label', 'name', 'mod_label'),
(121, 'label', 'update', 'label', 'name', 'mod_label'),
(122, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(123, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(124, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(125, 'lti', 'view', 'lti', 'name', 'mod_lti'),
(126, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
(127, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
(128, 'page', 'view', 'page', 'name', 'mod_page'),
(129, 'page', 'view all', 'page', 'name', 'mod_page'),
(130, 'page', 'update', 'page', 'name', 'mod_page'),
(131, 'page', 'add', 'page', 'name', 'mod_page'),
(132, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(133, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(134, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(135, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(136, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(137, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(138, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(139, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(140, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(141, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(142, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(143, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(144, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(145, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(146, 'quiz', 'view summary', 'quiz', 'name', 'mod_quiz'),
(147, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(148, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(149, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(150, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(151, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(152, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(153, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(154, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(155, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(156, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(157, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(158, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(159, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(160, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(161, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(162, 'url', 'view', 'url', 'name', 'mod_url'),
(163, 'url', 'view all', 'url', 'name', 'mod_url'),
(164, 'url', 'update', 'url', 'name', 'mod_url'),
(165, 'url', 'add', 'url', 'name', 'mod_url'),
(166, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(167, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(168, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(169, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(170, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(171, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(172, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(173, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(174, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(175, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(176, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(177, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(178, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(179, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(180, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(181, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(182, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(183, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(184, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop'),
(185, 'book', 'exportimscp', 'book', 'name', 'booktool_exportimscp'),
(186, 'book', 'print', 'book', 'name', 'booktool_print'),
(187, 'book', 'print chapter', 'book_chapters', 'title', 'booktool_print');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_queries`
--

CREATE TABLE IF NOT EXISTS `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext NOT NULL,
  `sqlparams` longtext,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext,
  `backtrace` longtext,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Logged database queries.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti`
--

CREATE TABLE IF NOT EXISTS `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext NOT NULL,
  `securetoolurl` longtext,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '100',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) DEFAULT NULL,
  `icon` longtext,
  `secureicon` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains Basic LTI activities instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of individual submissions for LTI activities.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_tool_proxies`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_tool_proxies` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'Tool Provider',
  `regurl` longtext,
  `state` tinyint(2) NOT NULL DEFAULT '1',
  `guid` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `vendorcode` varchar(255) DEFAULT NULL,
  `capabilityoffered` longtext NOT NULL,
  `serviceoffered` longtext NOT NULL,
  `toolproxy` longtext,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_ltitoolprox_gui_uix` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LTI tool proxy registrations' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_tool_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_tool_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `toolproxyid` bigint(10) NOT NULL,
  `course` bigint(10) DEFAULT NULL,
  `coursemoduleid` bigint(10) DEFAULT NULL,
  `settings` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitoolsett_too_ix` (`toolproxyid`),
  KEY `mdl_ltitoolsett_cou_ix` (`course`),
  KEY `mdl_ltitoolsett_cou2_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LTI tool setting values' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext NOT NULL,
  `tooldomain` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `toolproxyid` bigint(10) DEFAULT NULL,
  `enabledcapability` longtext,
  `parameter` longtext,
  `icon` longtext,
  `secureicon` longtext,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI pre-configured activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types_config`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI types configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message`
--

CREATE TABLE IF NOT EXISTS `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridto`),
  KEY `mdl_mess_useuse_ix` (`useridfrom`,`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all unread messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_messageinbound_datakeys`
--

CREATE TABLE IF NOT EXISTS `mdl_messageinbound_datakeys` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `handler` bigint(10) NOT NULL,
  `datavalue` bigint(10) NOT NULL,
  `datakey` varchar(64) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `expires` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messdata_handat_uix` (`handler`,`datavalue`),
  KEY `mdl_messdata_han_ix` (`handler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Inbound Message data item secret keys.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_messageinbound_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_messageinbound_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(255) NOT NULL DEFAULT '',
  `defaultexpiration` bigint(10) NOT NULL DEFAULT '86400',
  `validateaddress` tinyint(1) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messhand_cla_uix` (`classname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Inbound Message Handler definitions.' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_messageinbound_handlers`
--

INSERT INTO `mdl_messageinbound_handlers` (`id`, `component`, `classname`, `defaultexpiration`, `validateaddress`, `enabled`) VALUES
(1, 'core', '\\core\\message\\inbound\\private_files_handler', 0, 1, 0),
(2, 'mod_forum', '\\mod_forum\\message\\inbound\\reply_handler', 604800, 1, 0),
(3, 'tool_messageinbound', '\\tool_messageinbound\\message\\inbound\\invalid_recipient_handler', 604800, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_messageinbound_messagelist`
--

CREATE TABLE IF NOT EXISTS `mdl_messageinbound_messagelist` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `messageid` longtext NOT NULL,
  `userid` bigint(10) NOT NULL,
  `address` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messmess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of message IDs for existing replies' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_airnotifier_devices`
--

CREATE TABLE IF NOT EXISTS `mdl_message_airnotifier_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userdeviceid` bigint(10) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messairndevi_use_uix` (`userdeviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store information about the devices registered in Airnotifie' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_contacts`
--

CREATE TABLE IF NOT EXISTS `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains lists of relationships between users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_processors`
--

CREATE TABLE IF NOT EXISTS `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of message output plugins' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_message_processors`
--

INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'airnotifier', 0),
(2, 'email', 1),
(3, 'jabber', 1),
(4, 'popup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_providers`
--

CREATE TABLE IF NOT EXISTS `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `component` varchar(200) NOT NULL DEFAULT '',
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores the message providers (modules and core sy' AUTO_INCREMENT=29 ;

--
-- Dumping data for table `mdl_message_providers`
--

INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'availableupdate', 'moodle', 'moodle/site:config'),
(4, 'instantmessage', 'moodle', NULL),
(5, 'backup', 'moodle', 'moodle/site:config'),
(6, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(7, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(8, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(9, 'badgerecipientnotice', 'moodle', 'moodle/badges:earnbadge'),
(10, 'badgecreatornotice', 'moodle', NULL),
(11, 'assign_notification', 'mod_assign', NULL),
(12, 'assignment_updates', 'mod_assignment', NULL),
(13, 'submission', 'mod_feedback', NULL),
(14, 'message', 'mod_feedback', NULL),
(15, 'posts', 'mod_forum', NULL),
(16, 'graded_essay', 'mod_lesson', NULL),
(17, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(18, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
(19, 'attempt_overdue', 'mod_quiz', 'mod/quiz:emailwarnoverdue'),
(20, 'flatfile_enrolment', 'enrol_flatfile', NULL),
(21, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
(22, 'expiry_notification', 'enrol_manual', NULL),
(23, 'paypal_enrolment', 'enrol_paypal', NULL),
(24, 'expiry_notification', 'enrol_self', NULL),
(25, 'invalidrecipienthandler', 'tool_messageinbound', NULL),
(26, 'messageprocessingerror', 'tool_messageinbound', NULL),
(27, 'messageprocessingsuccess', 'tool_messageinbound', NULL),
(28, 'notification', 'tool_monitor', 'tool/monitor:subscribe');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_read`
--

CREATE TABLE IF NOT EXISTS `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridto`),
  KEY `mdl_messread_useuse_ix` (`useridfrom`,`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all messages that have been read' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_working`
--

CREATE TABLE IF NOT EXISTS `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messwork_unr_ix` (`unreadmessageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists all the messages and processors that need to be proces' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information fetched via XML-RPC about courses on ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information about enrolments of our local users i' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_application`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Information about applications on remote hosts' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_mnet_application`
--

INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `public_key` longtext NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  `sslverification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Information about the local and remote hosts for RPC' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`, `sslverification`) VALUES
(1, 0, 'http://localhost/moodle/trunk', '::1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1, 0),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host2service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about the services for a given host' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_log`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) NOT NULL DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table describes functions that might be called remotely' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext NOT NULL,
  `profile` longtext NOT NULL,
  `filename` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(150) DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Functions or methods that we may publish or subscribe to' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user''s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for ''All hosts'', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:14:"user details {";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can''t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(40) NOT NULL DEFAULT '',
  `apiversion` varchar(10) NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='A service is a group of functions' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_session`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `token` varchar(40) NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users by host permitted (or not) to login from a remote prov' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='modules available in the site' AUTO_INCREMENT=23 ;

--
-- Dumping data for table `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assign', 60, 0, '', 1),
(2, 'assignment', 60, 0, '', 0),
(3, 'book', 0, 0, '', 1),
(4, 'chat', 300, 0, '', 1),
(5, 'choice', 0, 0, '', 1),
(6, 'data', 0, 0, '', 1),
(7, 'feedback', 0, 0, '', 0),
(8, 'folder', 0, 0, '', 1),
(9, 'forum', 0, 0, '', 1),
(10, 'glossary', 0, 0, '', 1),
(11, 'imscp', 0, 0, '', 1),
(12, 'label', 0, 0, '', 1),
(13, 'lesson', 0, 0, '', 1),
(14, 'lti', 0, 0, '', 1),
(15, 'page', 0, 0, '', 1),
(16, 'quiz', 60, 0, '', 1),
(17, 'resource', 0, 0, '', 1),
(18, 'scorm', 300, 0, '', 1),
(19, 'survey', 0, 0, '', 1),
(20, 'url', 0, 0, '', 1),
(21, 'wiki', 0, 0, '', 1),
(22, 'workshop', 60, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_my_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Extra user pages for the My Moodle system' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0),
(3, 2, '__default', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_page`
--

CREATE TABLE IF NOT EXISTS `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one page and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='base table (not including config data) for instances of port' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='config for portfolio plugin instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_user`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user data for portfolio instances.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_log`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) NOT NULL DEFAULT '',
  `caller_file` varchar(255) NOT NULL DEFAULT '',
  `caller_component` varchar(255) DEFAULT NULL,
  `caller_sha1` varchar(255) NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) NOT NULL DEFAULT '',
  `continueurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log of portfolio transfers (used to later check for duplicat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='maps mahara tokens to transfer ids' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_tempdata`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  `queued` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores temporary data for portfolio exports. the id of this ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_post`
--

CREATE TABLE IF NOT EXISTS `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) NOT NULL DEFAULT '',
  `summary` longtext,
  `content` longtext,
  `uniquehash` varchar(255) NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) DEFAULT NULL,
  `publishstate` varchar(20) NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic post table to hold data blog entries etc in differen' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_profiling`
--

CREATE TABLE IF NOT EXISTS `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the results of all the profiling runs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_essay_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) NOT NULL DEFAULT 'editor',
  `responserequired` tinyint(2) NOT NULL DEFAULT '1',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `attachmentsrequired` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Extra options for essay questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines the question-type specific options for matching ques' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypmatcsubq_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The subquestions that make up a matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_multichoice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_multichoice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multiple choice questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_randomsamatch_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_randomsamatch_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  `subcats` tinyint(2) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtyprandopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about a random short-answer matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_shortanswer_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for short answer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question`
--

CREATE TABLE IF NOT EXISTS `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The questions themselves' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Answers, with a fractional grade (0-1) and feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext,
  `rightanswer` longtext,
  `responsesummary` longtext,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_beh_ix` (`behaviour`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each row here corresponds to an attempt at one question, as ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_steps`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores one step in in a question attempt. As well as the dat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_step_data`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each question_attempt_step has an associative array of the d' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Categories are for grouping questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_datasets`
--

CREATE TABLE IF NOT EXISTS `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Many-many relation between questions and dataset definitions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Organises and stores properties for dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_items`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Individual dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_hints`
--

CREATE TABLE IF NOT EXISTS `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the the part of the question definition that gives di' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_multianswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multianswer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for numerical questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type numerical This table is also u' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_units`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Optional unit options for numerical questions. This table is' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_response_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_question_response_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `whichtries` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `subqid` varchar(100) NOT NULL DEFAULT '',
  `aid` varchar(100) DEFAULT NULL,
  `response` longtext,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Analysis of student responses given to questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_response_count`
--

CREATE TABLE IF NOT EXISTS `mdl_question_response_count` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `analysisid` bigint(10) NOT NULL,
  `try` bigint(10) NOT NULL,
  `rcount` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesrespcoun_ana_ix` (`analysisid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count for each responses for each try at a question.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Statistics for individual questions used in an activity.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_truefalse`
--

CREATE TABLE IF NOT EXISTS `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for True-False questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_usages`
--

CREATE TABLE IF NOT EXISTS `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table''s main purpose it to assign a unique id to each a' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  `canredoquestions` smallint(4) NOT NULL DEFAULT '0',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) NOT NULL DEFAULT 'free',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  `completionattemptsexhausted` tinyint(1) DEFAULT '0',
  `completionpass` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The settings for each quiz.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores users attempts at quizzes.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Feedback given to students based on which grade band their o' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the overall grade for each user on the quiz, based on' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overrides`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to quiz settings on a per-user and per-group b' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table records which question attempts need regrading an' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_reports`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Lists all the installed quiz reports and their display order' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_quiz_reports`
--

INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `capability`) VALUES
(1, 'grading', 6000, 'mod/quiz:grade'),
(2, 'overview', 10000, NULL),
(3, 'responses', 9000, NULL),
(4, 'statistics', 8000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_sections`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL,
  `firstslot` bigint(10) NOT NULL,
  `heading` varchar(1333) DEFAULT NULL,
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizsect_quifir_uix` (`quizid`,`firstslot`),
  KEY `mdl_quizsect_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores sections of a quiz with section name (heading), from ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_slots`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_slots` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `slot` bigint(10) NOT NULL,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `page` bigint(10) NOT NULL,
  `requireprevious` smallint(4) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `maxmark` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizslot_quislo_uix` (`quizid`,`slot`),
  KEY `mdl_quizslot_qui_ix` (`quizid`),
  KEY `mdl_quizslot_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the question used in a quiz, with the order, and for ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `whichattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `highestattemptscount` bigint(10) NOT NULL,
  `lastattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table to cache results from analysis done in statistics repo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_rating`
--

CREATE TABLE IF NOT EXISTS `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `ratingarea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle ratings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_registration_hubs`
--

CREATE TABLE IF NOT EXISTS `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `hubname` varchar(255) NOT NULL DEFAULT '',
  `huburl` varchar(255) NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='hub where the site is registered on with their associated to' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository`
--

CREATE TABLE IF NOT EXISTS `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_repository`
--

INSERT INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
(1, 'areafiles', 1, 1),
(2, 'local', 1, 2),
(3, 'recent', 1, 3),
(4, 'upload', 1, 4),
(5, 'url', 1, 5),
(6, 'user', 1, 6),
(7, 'wikimedia', 1, 7),
(8, 'youtube', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_repository_instances`
--

INSERT INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
(1, '', 1, 0, 1, NULL, NULL, 1435054615, 1435054615, 0),
(2, '', 2, 0, 1, NULL, NULL, 1435054621, 1435054621, 0),
(3, '', 3, 0, 1, NULL, NULL, 1435054624, 1435054624, 0),
(4, '', 4, 0, 1, NULL, NULL, 1435054626, 1435054626, 0),
(5, '', 5, 0, 1, NULL, NULL, 1435054627, 1435054627, 0),
(6, '', 6, 0, 1, NULL, NULL, 1435054628, 1435054628, 0),
(7, '', 7, 0, 1, NULL, NULL, 1435054630, 1435054630, 0),
(8, '', 8, 0, 1, NULL, NULL, 1435054631, 1435054631, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The config for intances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource`
--

CREATE TABLE IF NOT EXISTS `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one resource and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource_old`
--

CREATE TABLE IF NOT EXISTS `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext NOT NULL,
  `popup` longtext NOT NULL,
  `options` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='backup of all old resource instances from 1.9' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role`
--

CREATE TABLE IF NOT EXISTS `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='moodle roles' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_role`
--

INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(1, '', 'manager', '', 1, 'manager'),
(2, '', 'coursecreator', '', 2, 'coursecreator'),
(3, '', 'editingteacher', '', 3, 'editingteacher'),
(4, '', 'teacher', '', 4, 'teacher'),
(5, '', 'student', '', 5, 'student'),
(6, '', 'guest', '', 6, 'guest'),
(7, '', 'user', '', 7, 'user'),
(8, '', 'frontpage', '', 8, 'frontpage');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines what role can assign what role' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_role_allow_assign`
--

INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_override`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines what role can override what role' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_role_allow_override`
--

INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_switch`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores which which other roles a user is allowed ' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_role_allow_switch`
--

INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_assignments`
--

CREATE TABLE IF NOT EXISTS `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='assigning roles in different context' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='permission has to be signed, overriding a capability for a p' AUTO_INCREMENT=1178 ;

--
-- Dumping data for table `mdl_role_capabilities`
--

INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1, 1, 1, 'moodle/site:readallmessages', 1, 1435054161, 0),
(2, 1, 3, 'moodle/site:readallmessages', 1, 1435054161, 0),
(3, 1, 1, 'moodle/site:sendmessage', 1, 1435054161, 0),
(4, 1, 7, 'moodle/site:sendmessage', 1, 1435054161, 0),
(5, 1, 1, 'moodle/site:approvecourse', 1, 1435054161, 0),
(6, 1, 3, 'moodle/backup:backupcourse', 1, 1435054162, 0),
(7, 1, 1, 'moodle/backup:backupcourse', 1, 1435054162, 0),
(8, 1, 3, 'moodle/backup:backupsection', 1, 1435054162, 0),
(9, 1, 1, 'moodle/backup:backupsection', 1, 1435054162, 0),
(10, 1, 3, 'moodle/backup:backupactivity', 1, 1435054162, 0),
(11, 1, 1, 'moodle/backup:backupactivity', 1, 1435054162, 0),
(12, 1, 3, 'moodle/backup:backuptargethub', 1, 1435054162, 0),
(13, 1, 1, 'moodle/backup:backuptargethub', 1, 1435054162, 0),
(14, 1, 3, 'moodle/backup:backuptargetimport', 1, 1435054162, 0),
(15, 1, 1, 'moodle/backup:backuptargetimport', 1, 1435054162, 0),
(16, 1, 3, 'moodle/backup:downloadfile', 1, 1435054162, 0),
(17, 1, 1, 'moodle/backup:downloadfile', 1, 1435054163, 0),
(18, 1, 3, 'moodle/backup:configure', 1, 1435054163, 0),
(19, 1, 1, 'moodle/backup:configure', 1, 1435054163, 0),
(20, 1, 1, 'moodle/backup:userinfo', 1, 1435054163, 0),
(21, 1, 1, 'moodle/backup:anonymise', 1, 1435054163, 0),
(22, 1, 3, 'moodle/restore:restorecourse', 1, 1435054163, 0),
(23, 1, 1, 'moodle/restore:restorecourse', 1, 1435054163, 0),
(24, 1, 3, 'moodle/restore:restoresection', 1, 1435054163, 0),
(25, 1, 1, 'moodle/restore:restoresection', 1, 1435054163, 0),
(26, 1, 3, 'moodle/restore:restoreactivity', 1, 1435054163, 0),
(27, 1, 1, 'moodle/restore:restoreactivity', 1, 1435054163, 0),
(28, 1, 3, 'moodle/restore:restoretargethub', 1, 1435054164, 0),
(29, 1, 1, 'moodle/restore:restoretargethub', 1, 1435054164, 0),
(30, 1, 3, 'moodle/restore:restoretargetimport', 1, 1435054164, 0),
(31, 1, 1, 'moodle/restore:restoretargetimport', 1, 1435054164, 0),
(32, 1, 3, 'moodle/restore:uploadfile', 1, 1435054164, 0),
(33, 1, 1, 'moodle/restore:uploadfile', 1, 1435054164, 0),
(34, 1, 3, 'moodle/restore:configure', 1, 1435054164, 0),
(35, 1, 1, 'moodle/restore:configure', 1, 1435054164, 0),
(36, 1, 2, 'moodle/restore:rolldates', 1, 1435054164, 0),
(37, 1, 1, 'moodle/restore:rolldates', 1, 1435054164, 0),
(38, 1, 1, 'moodle/restore:userinfo', 1, 1435054164, 0),
(39, 1, 1, 'moodle/restore:createuser', 1, 1435054164, 0),
(40, 1, 3, 'moodle/site:manageblocks', 1, 1435054165, 0),
(41, 1, 1, 'moodle/site:manageblocks', 1, 1435054165, 0),
(42, 1, 4, 'moodle/site:accessallgroups', 1, 1435054165, 0),
(43, 1, 3, 'moodle/site:accessallgroups', 1, 1435054165, 0),
(44, 1, 1, 'moodle/site:accessallgroups', 1, 1435054165, 0),
(45, 1, 4, 'moodle/site:viewfullnames', 1, 1435054165, 0),
(46, 1, 3, 'moodle/site:viewfullnames', 1, 1435054165, 0),
(47, 1, 1, 'moodle/site:viewfullnames', 1, 1435054165, 0),
(48, 1, 4, 'moodle/site:viewuseridentity', 1, 1435054165, 0),
(49, 1, 3, 'moodle/site:viewuseridentity', 1, 1435054165, 0),
(50, 1, 1, 'moodle/site:viewuseridentity', 1, 1435054165, 0),
(51, 1, 4, 'moodle/site:viewreports', 1, 1435054165, 0),
(52, 1, 3, 'moodle/site:viewreports', 1, 1435054165, 0),
(53, 1, 1, 'moodle/site:viewreports', 1, 1435054166, 0),
(54, 1, 3, 'moodle/site:trustcontent', 1, 1435054166, 0),
(55, 1, 1, 'moodle/site:trustcontent', 1, 1435054166, 0),
(56, 1, 1, 'moodle/site:uploadusers', 1, 1435054166, 0),
(57, 1, 3, 'moodle/filter:manage', 1, 1435054166, 0),
(58, 1, 1, 'moodle/filter:manage', 1, 1435054166, 0),
(59, 1, 1, 'moodle/user:create', 1, 1435054166, 0),
(60, 1, 1, 'moodle/user:delete', 1, 1435054166, 0),
(61, 1, 1, 'moodle/user:update', 1, 1435054166, 0),
(62, 1, 6, 'moodle/user:viewdetails', 1, 1435054166, 0),
(63, 1, 5, 'moodle/user:viewdetails', 1, 1435054167, 0),
(64, 1, 4, 'moodle/user:viewdetails', 1, 1435054167, 0),
(65, 1, 3, 'moodle/user:viewdetails', 1, 1435054167, 0),
(66, 1, 1, 'moodle/user:viewdetails', 1, 1435054167, 0),
(67, 1, 1, 'moodle/user:viewalldetails', 1, 1435054167, 0),
(68, 1, 1, 'moodle/user:viewlastip', 1, 1435054167, 0),
(69, 1, 4, 'moodle/user:viewhiddendetails', 1, 1435054167, 0),
(70, 1, 3, 'moodle/user:viewhiddendetails', 1, 1435054167, 0),
(71, 1, 1, 'moodle/user:viewhiddendetails', 1, 1435054167, 0),
(72, 1, 1, 'moodle/user:loginas', 1, 1435054167, 0),
(73, 1, 1, 'moodle/user:managesyspages', 1, 1435054167, 0),
(74, 1, 7, 'moodle/user:manageownblocks', 1, 1435054167, 0),
(75, 1, 7, 'moodle/user:manageownfiles', 1, 1435054168, 0),
(76, 1, 1, 'moodle/my:configsyspages', 1, 1435054168, 0),
(77, 1, 3, 'moodle/role:assign', 1, 1435054168, 0),
(78, 1, 1, 'moodle/role:assign', 1, 1435054168, 0),
(79, 1, 4, 'moodle/role:review', 1, 1435054168, 0),
(80, 1, 3, 'moodle/role:review', 1, 1435054168, 0),
(81, 1, 1, 'moodle/role:review', 1, 1435054168, 0),
(82, 1, 1, 'moodle/role:override', 1, 1435054168, 0),
(83, 1, 3, 'moodle/role:safeoverride', 1, 1435054168, 0),
(84, 1, 1, 'moodle/role:manage', 1, 1435054169, 0),
(85, 1, 3, 'moodle/role:switchroles', 1, 1435054169, 0),
(86, 1, 1, 'moodle/role:switchroles', 1, 1435054169, 0),
(87, 1, 1, 'moodle/category:manage', 1, 1435054169, 0),
(88, 1, 2, 'moodle/category:viewhiddencategories', 1, 1435054169, 0),
(89, 1, 1, 'moodle/category:viewhiddencategories', 1, 1435054169, 0),
(90, 1, 1, 'moodle/cohort:manage', 1, 1435054169, 0),
(91, 1, 1, 'moodle/cohort:assign', 1, 1435054169, 0),
(92, 1, 3, 'moodle/cohort:view', 1, 1435054169, 0),
(93, 1, 1, 'moodle/cohort:view', 1, 1435054169, 0),
(94, 1, 2, 'moodle/course:create', 1, 1435054170, 0),
(95, 1, 1, 'moodle/course:create', 1, 1435054170, 0),
(96, 1, 7, 'moodle/course:request', 1, 1435054170, 0),
(97, 1, 1, 'moodle/course:delete', 1, 1435054170, 0),
(98, 1, 3, 'moodle/course:update', 1, 1435054170, 0),
(99, 1, 1, 'moodle/course:update', 1, 1435054170, 0),
(100, 1, 1, 'moodle/course:view', 1, 1435054170, 0),
(101, 1, 3, 'moodle/course:enrolreview', 1, 1435054170, 0),
(102, 1, 1, 'moodle/course:enrolreview', 1, 1435054170, 0),
(103, 1, 3, 'moodle/course:enrolconfig', 1, 1435054171, 0),
(104, 1, 1, 'moodle/course:enrolconfig', 1, 1435054171, 0),
(105, 1, 3, 'moodle/course:reviewotherusers', 1, 1435054171, 0),
(106, 1, 1, 'moodle/course:reviewotherusers', 1, 1435054171, 0),
(107, 1, 4, 'moodle/course:bulkmessaging', 1, 1435054171, 0),
(108, 1, 3, 'moodle/course:bulkmessaging', 1, 1435054171, 0),
(109, 1, 1, 'moodle/course:bulkmessaging', 1, 1435054171, 0),
(110, 1, 4, 'moodle/course:viewhiddenuserfields', 1, 1435054171, 0),
(111, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1435054171, 0),
(112, 1, 1, 'moodle/course:viewhiddenuserfields', 1, 1435054171, 0),
(113, 1, 2, 'moodle/course:viewhiddencourses', 1, 1435054171, 0),
(114, 1, 4, 'moodle/course:viewhiddencourses', 1, 1435054172, 0),
(115, 1, 3, 'moodle/course:viewhiddencourses', 1, 1435054172, 0),
(116, 1, 1, 'moodle/course:viewhiddencourses', 1, 1435054172, 0),
(117, 1, 3, 'moodle/course:visibility', 1, 1435054172, 0),
(118, 1, 1, 'moodle/course:visibility', 1, 1435054172, 0),
(119, 1, 3, 'moodle/course:managefiles', 1, 1435054172, 0),
(120, 1, 1, 'moodle/course:managefiles', 1, 1435054172, 0),
(121, 1, 3, 'moodle/course:manageactivities', 1, 1435054172, 0),
(122, 1, 1, 'moodle/course:manageactivities', 1, 1435054172, 0),
(123, 1, 3, 'moodle/course:activityvisibility', 1, 1435054172, 0),
(124, 1, 1, 'moodle/course:activityvisibility', 1, 1435054172, 0),
(125, 1, 4, 'moodle/course:viewhiddenactivities', 1, 1435054173, 0),
(126, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1435054173, 0),
(127, 1, 1, 'moodle/course:viewhiddenactivities', 1, 1435054173, 0),
(128, 1, 5, 'moodle/course:viewparticipants', 1, 1435054173, 0),
(129, 1, 4, 'moodle/course:viewparticipants', 1, 1435054173, 0),
(130, 1, 3, 'moodle/course:viewparticipants', 1, 1435054173, 0),
(131, 1, 1, 'moodle/course:viewparticipants', 1, 1435054173, 0),
(132, 1, 3, 'moodle/course:changefullname', 1, 1435054173, 0),
(133, 1, 1, 'moodle/course:changefullname', 1, 1435054173, 0),
(134, 1, 3, 'moodle/course:changeshortname', 1, 1435054173, 0),
(135, 1, 1, 'moodle/course:changeshortname', 1, 1435054173, 0),
(136, 1, 3, 'moodle/course:changeidnumber', 1, 1435054174, 0),
(137, 1, 1, 'moodle/course:changeidnumber', 1, 1435054174, 0),
(138, 1, 3, 'moodle/course:changecategory', 1, 1435054174, 0),
(139, 1, 1, 'moodle/course:changecategory', 1, 1435054174, 0),
(140, 1, 3, 'moodle/course:changesummary', 1, 1435054174, 0),
(141, 1, 1, 'moodle/course:changesummary', 1, 1435054174, 0),
(142, 1, 1, 'moodle/site:viewparticipants', 1, 1435054174, 0),
(143, 1, 5, 'moodle/course:isincompletionreports', 1, 1435054174, 0),
(144, 1, 5, 'moodle/course:viewscales', 1, 1435054174, 0),
(145, 1, 4, 'moodle/course:viewscales', 1, 1435054174, 0),
(146, 1, 3, 'moodle/course:viewscales', 1, 1435054175, 0),
(147, 1, 1, 'moodle/course:viewscales', 1, 1435054175, 0),
(148, 1, 3, 'moodle/course:managescales', 1, 1435054175, 0),
(149, 1, 1, 'moodle/course:managescales', 1, 1435054175, 0),
(150, 1, 3, 'moodle/course:managegroups', 1, 1435054175, 0),
(151, 1, 1, 'moodle/course:managegroups', 1, 1435054175, 0),
(152, 1, 3, 'moodle/course:reset', 1, 1435054175, 0),
(153, 1, 1, 'moodle/course:reset', 1, 1435054175, 0),
(154, 1, 3, 'moodle/course:viewsuspendedusers', 1, 1435054175, 0),
(155, 1, 1, 'moodle/course:viewsuspendedusers', 1, 1435054175, 0),
(156, 1, 6, 'moodle/blog:view', 1, 1435054175, 0),
(157, 1, 7, 'moodle/blog:view', 1, 1435054175, 0),
(158, 1, 5, 'moodle/blog:view', 1, 1435054176, 0),
(159, 1, 4, 'moodle/blog:view', 1, 1435054176, 0),
(160, 1, 3, 'moodle/blog:view', 1, 1435054176, 0),
(161, 1, 1, 'moodle/blog:view', 1, 1435054176, 0),
(162, 1, 6, 'moodle/blog:search', 1, 1435054176, 0),
(163, 1, 7, 'moodle/blog:search', 1, 1435054176, 0),
(164, 1, 5, 'moodle/blog:search', 1, 1435054176, 0),
(165, 1, 4, 'moodle/blog:search', 1, 1435054176, 0),
(166, 1, 3, 'moodle/blog:search', 1, 1435054176, 0),
(167, 1, 1, 'moodle/blog:search', 1, 1435054176, 0),
(168, 1, 1, 'moodle/blog:viewdrafts', 1, 1435054176, 0),
(169, 1, 7, 'moodle/blog:create', 1, 1435054176, 0),
(170, 1, 1, 'moodle/blog:create', 1, 1435054177, 0),
(171, 1, 4, 'moodle/blog:manageentries', 1, 1435054177, 0),
(172, 1, 3, 'moodle/blog:manageentries', 1, 1435054177, 0),
(173, 1, 1, 'moodle/blog:manageentries', 1, 1435054177, 0),
(174, 1, 5, 'moodle/blog:manageexternal', 1, 1435054177, 0),
(175, 1, 7, 'moodle/blog:manageexternal', 1, 1435054177, 0),
(176, 1, 4, 'moodle/blog:manageexternal', 1, 1435054177, 0),
(177, 1, 3, 'moodle/blog:manageexternal', 1, 1435054177, 0),
(178, 1, 1, 'moodle/blog:manageexternal', 1, 1435054177, 0),
(179, 1, 7, 'moodle/calendar:manageownentries', 1, 1435054177, 0),
(180, 1, 1, 'moodle/calendar:manageownentries', 1, 1435054177, 0),
(181, 1, 4, 'moodle/calendar:managegroupentries', 1, 1435054178, 0),
(182, 1, 3, 'moodle/calendar:managegroupentries', 1, 1435054178, 0),
(183, 1, 1, 'moodle/calendar:managegroupentries', 1, 1435054178, 0),
(184, 1, 4, 'moodle/calendar:manageentries', 1, 1435054178, 0),
(185, 1, 3, 'moodle/calendar:manageentries', 1, 1435054178, 0),
(186, 1, 1, 'moodle/calendar:manageentries', 1, 1435054178, 0),
(187, 1, 1, 'moodle/user:editprofile', 1, 1435054178, 0),
(188, 1, 6, 'moodle/user:editownprofile', -1000, 1435054178, 0),
(189, 1, 7, 'moodle/user:editownprofile', 1, 1435054178, 0),
(190, 1, 1, 'moodle/user:editownprofile', 1, 1435054178, 0),
(191, 1, 6, 'moodle/user:changeownpassword', -1000, 1435054178, 0),
(192, 1, 7, 'moodle/user:changeownpassword', 1, 1435054179, 0),
(193, 1, 1, 'moodle/user:changeownpassword', 1, 1435054179, 0),
(194, 1, 5, 'moodle/user:readuserposts', 1, 1435054179, 0),
(195, 1, 4, 'moodle/user:readuserposts', 1, 1435054179, 0),
(196, 1, 3, 'moodle/user:readuserposts', 1, 1435054179, 0),
(197, 1, 1, 'moodle/user:readuserposts', 1, 1435054179, 0),
(198, 1, 5, 'moodle/user:readuserblogs', 1, 1435054179, 0),
(199, 1, 4, 'moodle/user:readuserblogs', 1, 1435054179, 0),
(200, 1, 3, 'moodle/user:readuserblogs', 1, 1435054179, 0),
(201, 1, 1, 'moodle/user:readuserblogs', 1, 1435054179, 0),
(202, 1, 1, 'moodle/user:editmessageprofile', 1, 1435054179, 0),
(203, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1435054180, 0),
(204, 1, 7, 'moodle/user:editownmessageprofile', 1, 1435054180, 0),
(205, 1, 1, 'moodle/user:editownmessageprofile', 1, 1435054180, 0),
(206, 1, 3, 'moodle/question:managecategory', 1, 1435054180, 0),
(207, 1, 1, 'moodle/question:managecategory', 1, 1435054180, 0),
(208, 1, 3, 'moodle/question:add', 1, 1435054180, 0),
(209, 1, 1, 'moodle/question:add', 1, 1435054180, 0),
(210, 1, 3, 'moodle/question:editmine', 1, 1435054180, 0),
(211, 1, 1, 'moodle/question:editmine', 1, 1435054180, 0),
(212, 1, 3, 'moodle/question:editall', 1, 1435054180, 0),
(213, 1, 1, 'moodle/question:editall', 1, 1435054180, 0),
(214, 1, 3, 'moodle/question:viewmine', 1, 1435054181, 0),
(215, 1, 1, 'moodle/question:viewmine', 1, 1435054181, 0),
(216, 1, 3, 'moodle/question:viewall', 1, 1435054181, 0),
(217, 1, 1, 'moodle/question:viewall', 1, 1435054181, 0),
(218, 1, 3, 'moodle/question:usemine', 1, 1435054181, 0),
(219, 1, 1, 'moodle/question:usemine', 1, 1435054181, 0),
(220, 1, 3, 'moodle/question:useall', 1, 1435054181, 0),
(221, 1, 1, 'moodle/question:useall', 1, 1435054181, 0),
(222, 1, 3, 'moodle/question:movemine', 1, 1435054181, 0),
(223, 1, 1, 'moodle/question:movemine', 1, 1435054181, 0),
(224, 1, 3, 'moodle/question:moveall', 1, 1435054182, 0),
(225, 1, 1, 'moodle/question:moveall', 1, 1435054182, 0),
(226, 1, 1, 'moodle/question:config', 1, 1435054182, 0),
(227, 1, 5, 'moodle/question:flag', 1, 1435054182, 0),
(228, 1, 4, 'moodle/question:flag', 1, 1435054182, 0),
(229, 1, 3, 'moodle/question:flag', 1, 1435054182, 0),
(230, 1, 1, 'moodle/question:flag', 1, 1435054182, 0),
(231, 1, 4, 'moodle/site:doclinks', 1, 1435054182, 0),
(232, 1, 3, 'moodle/site:doclinks', 1, 1435054182, 0),
(233, 1, 1, 'moodle/site:doclinks', 1, 1435054182, 0),
(234, 1, 3, 'moodle/course:sectionvisibility', 1, 1435054183, 0),
(235, 1, 1, 'moodle/course:sectionvisibility', 1, 1435054183, 0),
(236, 1, 3, 'moodle/course:useremail', 1, 1435054183, 0),
(237, 1, 1, 'moodle/course:useremail', 1, 1435054183, 0),
(238, 1, 3, 'moodle/course:viewhiddensections', 1, 1435054183, 0),
(239, 1, 1, 'moodle/course:viewhiddensections', 1, 1435054183, 0),
(240, 1, 3, 'moodle/course:setcurrentsection', 1, 1435054183, 0),
(241, 1, 1, 'moodle/course:setcurrentsection', 1, 1435054183, 0),
(242, 1, 3, 'moodle/course:movesections', 1, 1435054183, 0),
(243, 1, 1, 'moodle/course:movesections', 1, 1435054183, 0),
(244, 1, 4, 'moodle/grade:viewall', 1, 1435054183, 0),
(245, 1, 3, 'moodle/grade:viewall', 1, 1435054184, 0),
(246, 1, 1, 'moodle/grade:viewall', 1, 1435054184, 0),
(247, 1, 5, 'moodle/grade:view', 1, 1435054184, 0),
(248, 1, 4, 'moodle/grade:viewhidden', 1, 1435054184, 0),
(249, 1, 3, 'moodle/grade:viewhidden', 1, 1435054184, 0),
(250, 1, 1, 'moodle/grade:viewhidden', 1, 1435054184, 0),
(251, 1, 3, 'moodle/grade:import', 1, 1435054184, 0),
(252, 1, 1, 'moodle/grade:import', 1, 1435054184, 0),
(253, 1, 4, 'moodle/grade:export', 1, 1435054184, 0),
(254, 1, 3, 'moodle/grade:export', 1, 1435054184, 0),
(255, 1, 1, 'moodle/grade:export', 1, 1435054184, 0),
(256, 1, 3, 'moodle/grade:manage', 1, 1435054185, 0),
(257, 1, 1, 'moodle/grade:manage', 1, 1435054185, 0),
(258, 1, 3, 'moodle/grade:edit', 1, 1435054185, 0),
(259, 1, 1, 'moodle/grade:edit', 1, 1435054185, 0),
(260, 1, 3, 'moodle/grade:managegradingforms', 1, 1435054185, 0),
(261, 1, 1, 'moodle/grade:managegradingforms', 1, 1435054185, 0),
(262, 1, 1, 'moodle/grade:sharegradingforms', 1, 1435054185, 0),
(263, 1, 1, 'moodle/grade:managesharedforms', 1, 1435054185, 0),
(264, 1, 3, 'moodle/grade:manageoutcomes', 1, 1435054185, 0),
(265, 1, 1, 'moodle/grade:manageoutcomes', 1, 1435054185, 0),
(266, 1, 3, 'moodle/grade:manageletters', 1, 1435054185, 0),
(267, 1, 1, 'moodle/grade:manageletters', 1, 1435054185, 0),
(268, 1, 3, 'moodle/grade:hide', 1, 1435054186, 0),
(269, 1, 1, 'moodle/grade:hide', 1, 1435054186, 0),
(270, 1, 3, 'moodle/grade:lock', 1, 1435054186, 0),
(271, 1, 1, 'moodle/grade:lock', 1, 1435054186, 0),
(272, 1, 3, 'moodle/grade:unlock', 1, 1435054186, 0),
(273, 1, 1, 'moodle/grade:unlock', 1, 1435054186, 0),
(274, 1, 7, 'moodle/my:manageblocks', 1, 1435054186, 0),
(275, 1, 4, 'moodle/notes:view', 1, 1435054186, 0),
(276, 1, 3, 'moodle/notes:view', 1, 1435054186, 0),
(277, 1, 1, 'moodle/notes:view', 1, 1435054187, 0),
(278, 1, 4, 'moodle/notes:manage', 1, 1435054187, 0),
(279, 1, 3, 'moodle/notes:manage', 1, 1435054187, 0),
(280, 1, 1, 'moodle/notes:manage', 1, 1435054187, 0),
(281, 1, 4, 'moodle/tag:manage', 1, 1435054187, 0),
(282, 1, 3, 'moodle/tag:manage', 1, 1435054187, 0),
(283, 1, 1, 'moodle/tag:manage', 1, 1435054187, 0),
(284, 1, 1, 'moodle/tag:create', 1, 1435054187, 0),
(285, 1, 7, 'moodle/tag:create', 1, 1435054187, 0),
(286, 1, 1, 'moodle/tag:edit', 1, 1435054187, 0),
(287, 1, 7, 'moodle/tag:edit', 1, 1435054187, 0),
(288, 1, 1, 'moodle/tag:flag', 1, 1435054188, 0),
(289, 1, 7, 'moodle/tag:flag', 1, 1435054188, 0),
(290, 1, 4, 'moodle/tag:editblocks', 1, 1435054188, 0),
(291, 1, 3, 'moodle/tag:editblocks', 1, 1435054188, 0),
(292, 1, 1, 'moodle/tag:editblocks', 1, 1435054188, 0),
(293, 1, 6, 'moodle/block:view', 1, 1435054188, 0),
(294, 1, 7, 'moodle/block:view', 1, 1435054188, 0),
(295, 1, 5, 'moodle/block:view', 1, 1435054188, 0),
(296, 1, 4, 'moodle/block:view', 1, 1435054188, 0),
(297, 1, 3, 'moodle/block:view', 1, 1435054188, 0),
(298, 1, 3, 'moodle/block:edit', 1, 1435054188, 0),
(299, 1, 1, 'moodle/block:edit', 1, 1435054189, 0),
(300, 1, 7, 'moodle/portfolio:export', 1, 1435054189, 0),
(301, 1, 5, 'moodle/portfolio:export', 1, 1435054189, 0),
(302, 1, 4, 'moodle/portfolio:export', 1, 1435054189, 0),
(303, 1, 3, 'moodle/portfolio:export', 1, 1435054189, 0),
(304, 1, 8, 'moodle/comment:view', 1, 1435054189, 0),
(305, 1, 6, 'moodle/comment:view', 1, 1435054189, 0),
(306, 1, 7, 'moodle/comment:view', 1, 1435054189, 0),
(307, 1, 5, 'moodle/comment:view', 1, 1435054189, 0),
(308, 1, 4, 'moodle/comment:view', 1, 1435054189, 0),
(309, 1, 3, 'moodle/comment:view', 1, 1435054189, 0),
(310, 1, 1, 'moodle/comment:view', 1, 1435054189, 0),
(311, 1, 7, 'moodle/comment:post', 1, 1435054189, 0),
(312, 1, 5, 'moodle/comment:post', 1, 1435054189, 0),
(313, 1, 4, 'moodle/comment:post', 1, 1435054189, 0),
(314, 1, 3, 'moodle/comment:post', 1, 1435054190, 0),
(315, 1, 1, 'moodle/comment:post', 1, 1435054190, 0),
(316, 1, 3, 'moodle/comment:delete', 1, 1435054190, 0),
(317, 1, 1, 'moodle/comment:delete', 1, 1435054190, 0),
(318, 1, 1, 'moodle/webservice:createtoken', 1, 1435054190, 0),
(319, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1435054190, 0),
(320, 1, 7, 'moodle/rating:view', 1, 1435054190, 0),
(321, 1, 5, 'moodle/rating:view', 1, 1435054190, 0),
(322, 1, 4, 'moodle/rating:view', 1, 1435054190, 0),
(323, 1, 3, 'moodle/rating:view', 1, 1435054190, 0),
(324, 1, 1, 'moodle/rating:view', 1, 1435054190, 0),
(325, 1, 7, 'moodle/rating:viewany', 1, 1435054191, 0),
(326, 1, 5, 'moodle/rating:viewany', 1, 1435054191, 0),
(327, 1, 4, 'moodle/rating:viewany', 1, 1435054191, 0),
(328, 1, 3, 'moodle/rating:viewany', 1, 1435054191, 0),
(329, 1, 1, 'moodle/rating:viewany', 1, 1435054191, 0),
(330, 1, 7, 'moodle/rating:viewall', 1, 1435054191, 0),
(331, 1, 5, 'moodle/rating:viewall', 1, 1435054191, 0),
(332, 1, 4, 'moodle/rating:viewall', 1, 1435054191, 0),
(333, 1, 3, 'moodle/rating:viewall', 1, 1435054191, 0),
(334, 1, 1, 'moodle/rating:viewall', 1, 1435054191, 0),
(335, 1, 7, 'moodle/rating:rate', 1, 1435054191, 0),
(336, 1, 5, 'moodle/rating:rate', 1, 1435054191, 0),
(337, 1, 4, 'moodle/rating:rate', 1, 1435054191, 0),
(338, 1, 3, 'moodle/rating:rate', 1, 1435054191, 0),
(339, 1, 1, 'moodle/rating:rate', 1, 1435054191, 0),
(340, 1, 1, 'moodle/course:publish', 1, 1435054192, 0),
(341, 1, 4, 'moodle/course:markcomplete', 1, 1435054192, 0),
(342, 1, 3, 'moodle/course:markcomplete', 1, 1435054192, 0),
(343, 1, 1, 'moodle/course:markcomplete', 1, 1435054192, 0),
(344, 1, 1, 'moodle/community:add', 1, 1435054192, 0),
(345, 1, 4, 'moodle/community:add', 1, 1435054192, 0),
(346, 1, 3, 'moodle/community:add', 1, 1435054192, 0),
(347, 1, 1, 'moodle/community:download', 1, 1435054192, 0),
(348, 1, 3, 'moodle/community:download', 1, 1435054192, 0),
(349, 1, 1, 'moodle/badges:manageglobalsettings', 1, 1435054193, 0),
(350, 1, 7, 'moodle/badges:viewbadges', 1, 1435054193, 0),
(351, 1, 7, 'moodle/badges:manageownbadges', 1, 1435054193, 0),
(352, 1, 7, 'moodle/badges:viewotherbadges', 1, 1435054193, 0),
(353, 1, 7, 'moodle/badges:earnbadge', 1, 1435054193, 0),
(354, 1, 1, 'moodle/badges:createbadge', 1, 1435054193, 0),
(355, 1, 3, 'moodle/badges:createbadge', 1, 1435054193, 0),
(356, 1, 1, 'moodle/badges:deletebadge', 1, 1435054194, 0),
(357, 1, 3, 'moodle/badges:deletebadge', 1, 1435054194, 0),
(358, 1, 1, 'moodle/badges:configuredetails', 1, 1435054194, 0),
(359, 1, 3, 'moodle/badges:configuredetails', 1, 1435054194, 0),
(360, 1, 1, 'moodle/badges:configurecriteria', 1, 1435054194, 0),
(361, 1, 3, 'moodle/badges:configurecriteria', 1, 1435054194, 0),
(362, 1, 1, 'moodle/badges:configuremessages', 1, 1435054194, 0),
(363, 1, 3, 'moodle/badges:configuremessages', 1, 1435054194, 0),
(364, 1, 1, 'moodle/badges:awardbadge', 1, 1435054194, 0),
(365, 1, 4, 'moodle/badges:awardbadge', 1, 1435054195, 0),
(366, 1, 3, 'moodle/badges:awardbadge', 1, 1435054195, 0),
(367, 1, 1, 'moodle/badges:viewawarded', 1, 1435054195, 0),
(368, 1, 4, 'moodle/badges:viewawarded', 1, 1435054195, 0),
(369, 1, 3, 'moodle/badges:viewawarded', 1, 1435054195, 0),
(370, 1, 6, 'mod/assign:view', 1, 1435054327, 0),
(371, 1, 5, 'mod/assign:view', 1, 1435054327, 0),
(372, 1, 4, 'mod/assign:view', 1, 1435054328, 0),
(373, 1, 3, 'mod/assign:view', 1, 1435054328, 0),
(374, 1, 1, 'mod/assign:view', 1, 1435054328, 0),
(375, 1, 5, 'mod/assign:submit', 1, 1435054328, 0),
(376, 1, 4, 'mod/assign:grade', 1, 1435054328, 0),
(377, 1, 3, 'mod/assign:grade', 1, 1435054328, 0),
(378, 1, 1, 'mod/assign:grade', 1, 1435054328, 0),
(379, 1, 4, 'mod/assign:exportownsubmission', 1, 1435054328, 0),
(380, 1, 3, 'mod/assign:exportownsubmission', 1, 1435054328, 0),
(381, 1, 1, 'mod/assign:exportownsubmission', 1, 1435054328, 0),
(382, 1, 5, 'mod/assign:exportownsubmission', 1, 1435054329, 0),
(383, 1, 3, 'mod/assign:addinstance', 1, 1435054329, 0),
(384, 1, 1, 'mod/assign:addinstance', 1, 1435054329, 0),
(385, 1, 4, 'mod/assign:grantextension', 1, 1435054329, 0),
(386, 1, 3, 'mod/assign:grantextension', 1, 1435054329, 0),
(387, 1, 1, 'mod/assign:grantextension', 1, 1435054329, 0),
(388, 1, 3, 'mod/assign:revealidentities', 1, 1435054329, 0),
(389, 1, 1, 'mod/assign:revealidentities', 1, 1435054329, 0),
(390, 1, 3, 'mod/assign:reviewgrades', 1, 1435054329, 0),
(391, 1, 1, 'mod/assign:reviewgrades', 1, 1435054329, 0),
(392, 1, 3, 'mod/assign:releasegrades', 1, 1435054330, 0),
(393, 1, 1, 'mod/assign:releasegrades', 1, 1435054330, 0),
(394, 1, 3, 'mod/assign:managegrades', 1, 1435054330, 0),
(395, 1, 1, 'mod/assign:managegrades', 1, 1435054330, 0),
(396, 1, 3, 'mod/assign:manageallocations', 1, 1435054330, 0),
(397, 1, 1, 'mod/assign:manageallocations', 1, 1435054330, 0),
(398, 1, 3, 'mod/assign:viewgrades', 1, 1435054330, 0),
(399, 1, 1, 'mod/assign:viewgrades', 1, 1435054330, 0),
(400, 1, 4, 'mod/assign:viewgrades', 1, 1435054330, 0),
(401, 1, 1, 'mod/assign:viewblinddetails', 1, 1435054331, 0),
(402, 1, 4, 'mod/assign:receivegradernotifications', 1, 1435054331, 0),
(403, 1, 3, 'mod/assign:receivegradernotifications', 1, 1435054331, 0),
(404, 1, 1, 'mod/assign:receivegradernotifications', 1, 1435054331, 0),
(405, 1, 6, 'mod/assignment:view', 1, 1435054336, 0),
(406, 1, 5, 'mod/assignment:view', 1, 1435054336, 0),
(407, 1, 4, 'mod/assignment:view', 1, 1435054336, 0),
(408, 1, 3, 'mod/assignment:view', 1, 1435054336, 0),
(409, 1, 1, 'mod/assignment:view', 1, 1435054336, 0),
(410, 1, 3, 'mod/assignment:addinstance', 1, 1435054336, 0),
(411, 1, 1, 'mod/assignment:addinstance', 1, 1435054336, 0),
(412, 1, 5, 'mod/assignment:submit', 1, 1435054337, 0),
(413, 1, 4, 'mod/assignment:grade', 1, 1435054337, 0),
(414, 1, 3, 'mod/assignment:grade', 1, 1435054337, 0),
(415, 1, 1, 'mod/assignment:grade', 1, 1435054337, 0),
(416, 1, 4, 'mod/assignment:exportownsubmission', 1, 1435054337, 0),
(417, 1, 3, 'mod/assignment:exportownsubmission', 1, 1435054337, 0),
(418, 1, 1, 'mod/assignment:exportownsubmission', 1, 1435054337, 0),
(419, 1, 5, 'mod/assignment:exportownsubmission', 1, 1435054337, 0),
(420, 1, 3, 'mod/book:addinstance', 1, 1435054339, 0),
(421, 1, 1, 'mod/book:addinstance', 1, 1435054339, 0),
(422, 1, 6, 'mod/book:read', 1, 1435054339, 0),
(423, 1, 8, 'mod/book:read', 1, 1435054339, 0),
(424, 1, 5, 'mod/book:read', 1, 1435054340, 0),
(425, 1, 4, 'mod/book:read', 1, 1435054340, 0),
(426, 1, 3, 'mod/book:read', 1, 1435054340, 0),
(427, 1, 1, 'mod/book:read', 1, 1435054340, 0),
(428, 1, 4, 'mod/book:viewhiddenchapters', 1, 1435054340, 0),
(429, 1, 3, 'mod/book:viewhiddenchapters', 1, 1435054340, 0),
(430, 1, 1, 'mod/book:viewhiddenchapters', 1, 1435054340, 0),
(431, 1, 3, 'mod/book:edit', 1, 1435054340, 0),
(432, 1, 1, 'mod/book:edit', 1, 1435054340, 0),
(433, 1, 3, 'mod/chat:addinstance', 1, 1435054343, 0),
(434, 1, 1, 'mod/chat:addinstance', 1, 1435054343, 0),
(435, 1, 5, 'mod/chat:chat', 1, 1435054344, 0),
(436, 1, 4, 'mod/chat:chat', 1, 1435054344, 0),
(437, 1, 3, 'mod/chat:chat', 1, 1435054344, 0),
(438, 1, 1, 'mod/chat:chat', 1, 1435054344, 0),
(439, 1, 5, 'mod/chat:readlog', 1, 1435054344, 0),
(440, 1, 4, 'mod/chat:readlog', 1, 1435054344, 0),
(441, 1, 3, 'mod/chat:readlog', 1, 1435054344, 0),
(442, 1, 1, 'mod/chat:readlog', 1, 1435054344, 0),
(443, 1, 4, 'mod/chat:deletelog', 1, 1435054344, 0),
(444, 1, 3, 'mod/chat:deletelog', 1, 1435054344, 0),
(445, 1, 1, 'mod/chat:deletelog', 1, 1435054344, 0),
(446, 1, 4, 'mod/chat:exportparticipatedsession', 1, 1435054345, 0),
(447, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1435054345, 0),
(448, 1, 1, 'mod/chat:exportparticipatedsession', 1, 1435054345, 0),
(449, 1, 4, 'mod/chat:exportsession', 1, 1435054345, 0),
(450, 1, 3, 'mod/chat:exportsession', 1, 1435054345, 0),
(451, 1, 1, 'mod/chat:exportsession', 1, 1435054345, 0),
(452, 1, 3, 'mod/choice:addinstance', 1, 1435054347, 0),
(453, 1, 1, 'mod/choice:addinstance', 1, 1435054347, 0),
(454, 1, 5, 'mod/choice:choose', 1, 1435054348, 0),
(455, 1, 4, 'mod/choice:choose', 1, 1435054348, 0),
(456, 1, 3, 'mod/choice:choose', 1, 1435054348, 0),
(457, 1, 4, 'mod/choice:readresponses', 1, 1435054348, 0),
(458, 1, 3, 'mod/choice:readresponses', 1, 1435054348, 0),
(459, 1, 1, 'mod/choice:readresponses', 1, 1435054348, 0),
(460, 1, 4, 'mod/choice:deleteresponses', 1, 1435054348, 0),
(461, 1, 3, 'mod/choice:deleteresponses', 1, 1435054348, 0),
(462, 1, 1, 'mod/choice:deleteresponses', 1, 1435054348, 0),
(463, 1, 4, 'mod/choice:downloadresponses', 1, 1435054348, 0),
(464, 1, 3, 'mod/choice:downloadresponses', 1, 1435054348, 0),
(465, 1, 1, 'mod/choice:downloadresponses', 1, 1435054348, 0),
(466, 1, 3, 'mod/data:addinstance', 1, 1435054351, 0),
(467, 1, 1, 'mod/data:addinstance', 1, 1435054351, 0),
(468, 1, 8, 'mod/data:viewentry', 1, 1435054351, 0),
(469, 1, 6, 'mod/data:viewentry', 1, 1435054351, 0),
(470, 1, 5, 'mod/data:viewentry', 1, 1435054351, 0),
(471, 1, 4, 'mod/data:viewentry', 1, 1435054352, 0),
(472, 1, 3, 'mod/data:viewentry', 1, 1435054352, 0),
(473, 1, 1, 'mod/data:viewentry', 1, 1435054352, 0),
(474, 1, 5, 'mod/data:writeentry', 1, 1435054352, 0),
(475, 1, 4, 'mod/data:writeentry', 1, 1435054352, 0),
(476, 1, 3, 'mod/data:writeentry', 1, 1435054352, 0),
(477, 1, 1, 'mod/data:writeentry', 1, 1435054352, 0),
(478, 1, 5, 'mod/data:comment', 1, 1435054352, 0),
(479, 1, 4, 'mod/data:comment', 1, 1435054353, 0),
(480, 1, 3, 'mod/data:comment', 1, 1435054353, 0),
(481, 1, 1, 'mod/data:comment', 1, 1435054353, 0),
(482, 1, 4, 'mod/data:rate', 1, 1435054353, 0),
(483, 1, 3, 'mod/data:rate', 1, 1435054353, 0),
(484, 1, 1, 'mod/data:rate', 1, 1435054353, 0),
(485, 1, 4, 'mod/data:viewrating', 1, 1435054353, 0),
(486, 1, 3, 'mod/data:viewrating', 1, 1435054353, 0),
(487, 1, 1, 'mod/data:viewrating', 1, 1435054353, 0),
(488, 1, 4, 'mod/data:viewanyrating', 1, 1435054354, 0),
(489, 1, 3, 'mod/data:viewanyrating', 1, 1435054354, 0),
(490, 1, 1, 'mod/data:viewanyrating', 1, 1435054354, 0),
(491, 1, 4, 'mod/data:viewallratings', 1, 1435054354, 0),
(492, 1, 3, 'mod/data:viewallratings', 1, 1435054354, 0),
(493, 1, 1, 'mod/data:viewallratings', 1, 1435054354, 0),
(494, 1, 4, 'mod/data:approve', 1, 1435054354, 0),
(495, 1, 3, 'mod/data:approve', 1, 1435054354, 0),
(496, 1, 1, 'mod/data:approve', 1, 1435054354, 0),
(497, 1, 4, 'mod/data:manageentries', 1, 1435054355, 0),
(498, 1, 3, 'mod/data:manageentries', 1, 1435054355, 0),
(499, 1, 1, 'mod/data:manageentries', 1, 1435054355, 0),
(500, 1, 4, 'mod/data:managecomments', 1, 1435054355, 0),
(501, 1, 3, 'mod/data:managecomments', 1, 1435054355, 0),
(502, 1, 1, 'mod/data:managecomments', 1, 1435054355, 0),
(503, 1, 3, 'mod/data:managetemplates', 1, 1435054355, 0),
(504, 1, 1, 'mod/data:managetemplates', 1, 1435054355, 0),
(505, 1, 4, 'mod/data:viewalluserpresets', 1, 1435054355, 0),
(506, 1, 3, 'mod/data:viewalluserpresets', 1, 1435054356, 0),
(507, 1, 1, 'mod/data:viewalluserpresets', 1, 1435054356, 0),
(508, 1, 1, 'mod/data:manageuserpresets', 1, 1435054356, 0),
(509, 1, 1, 'mod/data:exportentry', 1, 1435054356, 0),
(510, 1, 4, 'mod/data:exportentry', 1, 1435054356, 0),
(511, 1, 3, 'mod/data:exportentry', 1, 1435054356, 0),
(512, 1, 1, 'mod/data:exportownentry', 1, 1435054357, 0),
(513, 1, 4, 'mod/data:exportownentry', 1, 1435054357, 0),
(514, 1, 3, 'mod/data:exportownentry', 1, 1435054357, 0),
(515, 1, 5, 'mod/data:exportownentry', 1, 1435054357, 0),
(516, 1, 1, 'mod/data:exportallentries', 1, 1435054357, 0),
(517, 1, 4, 'mod/data:exportallentries', 1, 1435054357, 0),
(518, 1, 3, 'mod/data:exportallentries', 1, 1435054357, 0),
(519, 1, 1, 'mod/data:exportuserinfo', 1, 1435054357, 0),
(520, 1, 4, 'mod/data:exportuserinfo', 1, 1435054357, 0),
(521, 1, 3, 'mod/data:exportuserinfo', 1, 1435054357, 0),
(522, 1, 3, 'mod/feedback:addinstance', 1, 1435054367, 0),
(523, 1, 1, 'mod/feedback:addinstance', 1, 1435054367, 0),
(524, 1, 6, 'mod/feedback:view', 1, 1435054367, 0),
(525, 1, 5, 'mod/feedback:view', 1, 1435054367, 0),
(526, 1, 4, 'mod/feedback:view', 1, 1435054368, 0),
(527, 1, 3, 'mod/feedback:view', 1, 1435054368, 0),
(528, 1, 1, 'mod/feedback:view', 1, 1435054368, 0),
(529, 1, 5, 'mod/feedback:complete', 1, 1435054368, 0),
(530, 1, 5, 'mod/feedback:viewanalysepage', 1, 1435054368, 0),
(531, 1, 3, 'mod/feedback:viewanalysepage', 1, 1435054368, 0),
(532, 1, 1, 'mod/feedback:viewanalysepage', 1, 1435054368, 0),
(533, 1, 3, 'mod/feedback:deletesubmissions', 1, 1435054368, 0),
(534, 1, 1, 'mod/feedback:deletesubmissions', 1, 1435054368, 0),
(535, 1, 1, 'mod/feedback:mapcourse', 1, 1435054368, 0),
(536, 1, 3, 'mod/feedback:edititems', 1, 1435054369, 0),
(537, 1, 1, 'mod/feedback:edititems', 1, 1435054369, 0),
(538, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1435054369, 0),
(539, 1, 1, 'mod/feedback:createprivatetemplate', 1, 1435054369, 0),
(540, 1, 3, 'mod/feedback:createpublictemplate', 1, 1435054369, 0),
(541, 1, 1, 'mod/feedback:createpublictemplate', 1, 1435054369, 0),
(542, 1, 3, 'mod/feedback:deletetemplate', 1, 1435054369, 0),
(543, 1, 1, 'mod/feedback:deletetemplate', 1, 1435054369, 0),
(544, 1, 4, 'mod/feedback:viewreports', 1, 1435054370, 0),
(545, 1, 3, 'mod/feedback:viewreports', 1, 1435054370, 0),
(546, 1, 1, 'mod/feedback:viewreports', 1, 1435054370, 0),
(547, 1, 4, 'mod/feedback:receivemail', 1, 1435054370, 0),
(548, 1, 3, 'mod/feedback:receivemail', 1, 1435054370, 0),
(549, 1, 3, 'mod/folder:addinstance', 1, 1435054372, 0),
(550, 1, 1, 'mod/folder:addinstance', 1, 1435054372, 0),
(551, 1, 6, 'mod/folder:view', 1, 1435054372, 0),
(552, 1, 7, 'mod/folder:view', 1, 1435054372, 0),
(553, 1, 3, 'mod/folder:managefiles', 1, 1435054372, 0),
(554, 1, 3, 'mod/forum:addinstance', 1, 1435054379, 0),
(555, 1, 1, 'mod/forum:addinstance', 1, 1435054379, 0),
(556, 1, 8, 'mod/forum:viewdiscussion', 1, 1435054380, 0),
(557, 1, 6, 'mod/forum:viewdiscussion', 1, 1435054380, 0),
(558, 1, 5, 'mod/forum:viewdiscussion', 1, 1435054380, 0),
(559, 1, 4, 'mod/forum:viewdiscussion', 1, 1435054380, 0),
(560, 1, 3, 'mod/forum:viewdiscussion', 1, 1435054380, 0),
(561, 1, 1, 'mod/forum:viewdiscussion', 1, 1435054380, 0),
(562, 1, 4, 'mod/forum:viewhiddentimedposts', 1, 1435054380, 0),
(563, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1435054381, 0),
(564, 1, 1, 'mod/forum:viewhiddentimedposts', 1, 1435054381, 0),
(565, 1, 5, 'mod/forum:startdiscussion', 1, 1435054381, 0),
(566, 1, 4, 'mod/forum:startdiscussion', 1, 1435054381, 0),
(567, 1, 3, 'mod/forum:startdiscussion', 1, 1435054381, 0),
(568, 1, 1, 'mod/forum:startdiscussion', 1, 1435054381, 0),
(569, 1, 5, 'mod/forum:replypost', 1, 1435054381, 0),
(570, 1, 4, 'mod/forum:replypost', 1, 1435054381, 0),
(571, 1, 3, 'mod/forum:replypost', 1, 1435054381, 0),
(572, 1, 1, 'mod/forum:replypost', 1, 1435054381, 0),
(573, 1, 4, 'mod/forum:addnews', 1, 1435054382, 0),
(574, 1, 3, 'mod/forum:addnews', 1, 1435054382, 0),
(575, 1, 1, 'mod/forum:addnews', 1, 1435054382, 0),
(576, 1, 4, 'mod/forum:replynews', 1, 1435054382, 0),
(577, 1, 3, 'mod/forum:replynews', 1, 1435054382, 0),
(578, 1, 1, 'mod/forum:replynews', 1, 1435054382, 0),
(579, 1, 5, 'mod/forum:viewrating', 1, 1435054382, 0),
(580, 1, 4, 'mod/forum:viewrating', 1, 1435054383, 0),
(581, 1, 3, 'mod/forum:viewrating', 1, 1435054384, 0),
(582, 1, 1, 'mod/forum:viewrating', 1, 1435054384, 0),
(583, 1, 4, 'mod/forum:viewanyrating', 1, 1435054385, 0),
(584, 1, 3, 'mod/forum:viewanyrating', 1, 1435054385, 0),
(585, 1, 1, 'mod/forum:viewanyrating', 1, 1435054385, 0),
(586, 1, 4, 'mod/forum:viewallratings', 1, 1435054386, 0),
(587, 1, 3, 'mod/forum:viewallratings', 1, 1435054386, 0),
(588, 1, 1, 'mod/forum:viewallratings', 1, 1435054386, 0),
(589, 1, 4, 'mod/forum:rate', 1, 1435054386, 0),
(590, 1, 3, 'mod/forum:rate', 1, 1435054386, 0),
(591, 1, 1, 'mod/forum:rate', 1, 1435054387, 0),
(592, 1, 5, 'mod/forum:createattachment', 1, 1435054387, 0),
(593, 1, 4, 'mod/forum:createattachment', 1, 1435054387, 0),
(594, 1, 3, 'mod/forum:createattachment', 1, 1435054387, 0),
(595, 1, 1, 'mod/forum:createattachment', 1, 1435054387, 0),
(596, 1, 5, 'mod/forum:deleteownpost', 1, 1435054387, 0),
(597, 1, 4, 'mod/forum:deleteownpost', 1, 1435054387, 0),
(598, 1, 3, 'mod/forum:deleteownpost', 1, 1435054387, 0),
(599, 1, 1, 'mod/forum:deleteownpost', 1, 1435054388, 0),
(600, 1, 4, 'mod/forum:deleteanypost', 1, 1435054388, 0),
(601, 1, 3, 'mod/forum:deleteanypost', 1, 1435054388, 0),
(602, 1, 1, 'mod/forum:deleteanypost', 1, 1435054388, 0),
(603, 1, 4, 'mod/forum:splitdiscussions', 1, 1435054388, 0),
(604, 1, 3, 'mod/forum:splitdiscussions', 1, 1435054388, 0),
(605, 1, 1, 'mod/forum:splitdiscussions', 1, 1435054388, 0),
(606, 1, 4, 'mod/forum:movediscussions', 1, 1435054388, 0),
(607, 1, 3, 'mod/forum:movediscussions', 1, 1435054388, 0),
(608, 1, 1, 'mod/forum:movediscussions', 1, 1435054389, 0),
(609, 1, 4, 'mod/forum:editanypost', 1, 1435054389, 0),
(610, 1, 3, 'mod/forum:editanypost', 1, 1435054389, 0),
(611, 1, 1, 'mod/forum:editanypost', 1, 1435054389, 0),
(612, 1, 4, 'mod/forum:viewqandawithoutposting', 1, 1435054389, 0),
(613, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1435054389, 0),
(614, 1, 1, 'mod/forum:viewqandawithoutposting', 1, 1435054389, 0),
(615, 1, 4, 'mod/forum:viewsubscribers', 1, 1435054389, 0),
(616, 1, 3, 'mod/forum:viewsubscribers', 1, 1435054389, 0),
(617, 1, 1, 'mod/forum:viewsubscribers', 1, 1435054389, 0),
(618, 1, 4, 'mod/forum:managesubscriptions', 1, 1435054390, 0),
(619, 1, 3, 'mod/forum:managesubscriptions', 1, 1435054390, 0),
(620, 1, 1, 'mod/forum:managesubscriptions', 1, 1435054390, 0),
(621, 1, 4, 'mod/forum:postwithoutthrottling', 1, 1435054390, 0),
(622, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1435054390, 0),
(623, 1, 1, 'mod/forum:postwithoutthrottling', 1, 1435054390, 0),
(624, 1, 4, 'mod/forum:exportdiscussion', 1, 1435054390, 0),
(625, 1, 3, 'mod/forum:exportdiscussion', 1, 1435054390, 0),
(626, 1, 1, 'mod/forum:exportdiscussion', 1, 1435054390, 0),
(627, 1, 4, 'mod/forum:exportpost', 1, 1435054390, 0),
(628, 1, 3, 'mod/forum:exportpost', 1, 1435054391, 0),
(629, 1, 1, 'mod/forum:exportpost', 1, 1435054391, 0),
(630, 1, 4, 'mod/forum:exportownpost', 1, 1435054391, 0),
(631, 1, 3, 'mod/forum:exportownpost', 1, 1435054391, 0),
(632, 1, 1, 'mod/forum:exportownpost', 1, 1435054391, 0),
(633, 1, 5, 'mod/forum:exportownpost', 1, 1435054391, 0),
(634, 1, 4, 'mod/forum:addquestion', 1, 1435054391, 0),
(635, 1, 3, 'mod/forum:addquestion', 1, 1435054391, 0),
(636, 1, 1, 'mod/forum:addquestion', 1, 1435054391, 0),
(637, 1, 5, 'mod/forum:allowforcesubscribe', 1, 1435054392, 0),
(638, 1, 4, 'mod/forum:allowforcesubscribe', 1, 1435054392, 0),
(639, 1, 3, 'mod/forum:allowforcesubscribe', 1, 1435054392, 0),
(640, 1, 8, 'mod/forum:allowforcesubscribe', 1, 1435054392, 0),
(641, 1, 4, 'mod/forum:canposttomygroups', 1, 1435054392, 0),
(642, 1, 3, 'mod/forum:canposttomygroups', 1, 1435054392, 0),
(643, 1, 1, 'mod/forum:canposttomygroups', 1, 1435054392, 0),
(644, 1, 3, 'mod/glossary:addinstance', 1, 1435054398, 0),
(645, 1, 1, 'mod/glossary:addinstance', 1, 1435054399, 0),
(646, 1, 8, 'mod/glossary:view', 1, 1435054399, 0),
(647, 1, 6, 'mod/glossary:view', 1, 1435054399, 0),
(648, 1, 5, 'mod/glossary:view', 1, 1435054399, 0),
(649, 1, 4, 'mod/glossary:view', 1, 1435054399, 0),
(650, 1, 3, 'mod/glossary:view', 1, 1435054399, 0),
(651, 1, 1, 'mod/glossary:view', 1, 1435054399, 0),
(652, 1, 5, 'mod/glossary:write', 1, 1435054399, 0),
(653, 1, 4, 'mod/glossary:write', 1, 1435054399, 0),
(654, 1, 3, 'mod/glossary:write', 1, 1435054399, 0),
(655, 1, 1, 'mod/glossary:write', 1, 1435054399, 0),
(656, 1, 4, 'mod/glossary:manageentries', 1, 1435054400, 0),
(657, 1, 3, 'mod/glossary:manageentries', 1, 1435054400, 0),
(658, 1, 1, 'mod/glossary:manageentries', 1, 1435054400, 0),
(659, 1, 4, 'mod/glossary:managecategories', 1, 1435054400, 0),
(660, 1, 3, 'mod/glossary:managecategories', 1, 1435054400, 0),
(661, 1, 1, 'mod/glossary:managecategories', 1, 1435054400, 0),
(662, 1, 5, 'mod/glossary:comment', 1, 1435054400, 0),
(663, 1, 4, 'mod/glossary:comment', 1, 1435054400, 0),
(664, 1, 3, 'mod/glossary:comment', 1, 1435054400, 0),
(665, 1, 1, 'mod/glossary:comment', 1, 1435054400, 0),
(666, 1, 4, 'mod/glossary:managecomments', 1, 1435054400, 0),
(667, 1, 3, 'mod/glossary:managecomments', 1, 1435054401, 0),
(668, 1, 1, 'mod/glossary:managecomments', 1, 1435054401, 0),
(669, 1, 4, 'mod/glossary:import', 1, 1435054401, 0),
(670, 1, 3, 'mod/glossary:import', 1, 1435054401, 0),
(671, 1, 1, 'mod/glossary:import', 1, 1435054401, 0),
(672, 1, 4, 'mod/glossary:export', 1, 1435054401, 0),
(673, 1, 3, 'mod/glossary:export', 1, 1435054401, 0),
(674, 1, 1, 'mod/glossary:export', 1, 1435054401, 0),
(675, 1, 4, 'mod/glossary:approve', 1, 1435054401, 0),
(676, 1, 3, 'mod/glossary:approve', 1, 1435054401, 0),
(677, 1, 1, 'mod/glossary:approve', 1, 1435054401, 0),
(678, 1, 4, 'mod/glossary:rate', 1, 1435054401, 0),
(679, 1, 3, 'mod/glossary:rate', 1, 1435054402, 0),
(680, 1, 1, 'mod/glossary:rate', 1, 1435054402, 0),
(681, 1, 4, 'mod/glossary:viewrating', 1, 1435054402, 0),
(682, 1, 3, 'mod/glossary:viewrating', 1, 1435054402, 0),
(683, 1, 1, 'mod/glossary:viewrating', 1, 1435054402, 0),
(684, 1, 4, 'mod/glossary:viewanyrating', 1, 1435054402, 0),
(685, 1, 3, 'mod/glossary:viewanyrating', 1, 1435054402, 0),
(686, 1, 1, 'mod/glossary:viewanyrating', 1, 1435054402, 0),
(687, 1, 4, 'mod/glossary:viewallratings', 1, 1435054402, 0),
(688, 1, 3, 'mod/glossary:viewallratings', 1, 1435054402, 0),
(689, 1, 1, 'mod/glossary:viewallratings', 1, 1435054402, 0),
(690, 1, 4, 'mod/glossary:exportentry', 1, 1435054402, 0),
(691, 1, 3, 'mod/glossary:exportentry', 1, 1435054403, 0),
(692, 1, 1, 'mod/glossary:exportentry', 1, 1435054403, 0),
(693, 1, 4, 'mod/glossary:exportownentry', 1, 1435054403, 0),
(694, 1, 3, 'mod/glossary:exportownentry', 1, 1435054403, 0),
(695, 1, 1, 'mod/glossary:exportownentry', 1, 1435054403, 0),
(696, 1, 5, 'mod/glossary:exportownentry', 1, 1435054403, 0),
(697, 1, 6, 'mod/imscp:view', 1, 1435054405, 0),
(698, 1, 7, 'mod/imscp:view', 1, 1435054405, 0),
(699, 1, 3, 'mod/imscp:addinstance', 1, 1435054405, 0),
(700, 1, 1, 'mod/imscp:addinstance', 1, 1435054405, 0),
(701, 1, 3, 'mod/label:addinstance', 1, 1435054406, 0),
(702, 1, 1, 'mod/label:addinstance', 1, 1435054406, 0),
(703, 1, 3, 'mod/lesson:addinstance', 1, 1435054411, 0),
(704, 1, 1, 'mod/lesson:addinstance', 1, 1435054411, 0),
(705, 1, 3, 'mod/lesson:edit', 1, 1435054411, 0),
(706, 1, 1, 'mod/lesson:edit', 1, 1435054412, 0),
(707, 1, 4, 'mod/lesson:grade', 1, 1435054412, 0),
(708, 1, 3, 'mod/lesson:grade', 1, 1435054412, 0),
(709, 1, 1, 'mod/lesson:grade', 1, 1435054412, 0),
(710, 1, 4, 'mod/lesson:viewreports', 1, 1435054412, 0),
(711, 1, 3, 'mod/lesson:viewreports', 1, 1435054412, 0),
(712, 1, 1, 'mod/lesson:viewreports', 1, 1435054412, 0),
(713, 1, 4, 'mod/lesson:manage', 1, 1435054412, 0),
(714, 1, 3, 'mod/lesson:manage', 1, 1435054412, 0),
(715, 1, 1, 'mod/lesson:manage', 1, 1435054412, 0),
(716, 1, 3, 'mod/lesson:manageoverrides', 1, 1435054413, 0),
(717, 1, 1, 'mod/lesson:manageoverrides', 1, 1435054413, 0),
(718, 1, 5, 'mod/lti:view', 1, 1435054418, 0),
(719, 1, 4, 'mod/lti:view', 1, 1435054418, 0),
(720, 1, 3, 'mod/lti:view', 1, 1435054418, 0),
(721, 1, 1, 'mod/lti:view', 1, 1435054418, 0),
(722, 1, 3, 'mod/lti:addinstance', 1, 1435054418, 0),
(723, 1, 1, 'mod/lti:addinstance', 1, 1435054418, 0),
(724, 1, 4, 'mod/lti:manage', 1, 1435054419, 0),
(725, 1, 3, 'mod/lti:manage', 1, 1435054419, 0),
(726, 1, 1, 'mod/lti:manage', 1, 1435054419, 0),
(727, 1, 3, 'mod/lti:addcoursetool', 1, 1435054419, 0),
(728, 1, 1, 'mod/lti:addcoursetool', 1, 1435054419, 0),
(729, 1, 3, 'mod/lti:requesttooladd', 1, 1435054419, 0),
(730, 1, 1, 'mod/lti:requesttooladd', 1, 1435054419, 0),
(731, 1, 6, 'mod/page:view', 1, 1435054420, 0),
(732, 1, 7, 'mod/page:view', 1, 1435054420, 0),
(733, 1, 3, 'mod/page:addinstance', 1, 1435054420, 0),
(734, 1, 1, 'mod/page:addinstance', 1, 1435054421, 0),
(735, 1, 6, 'mod/quiz:view', 1, 1435054425, 0),
(736, 1, 5, 'mod/quiz:view', 1, 1435054425, 0),
(737, 1, 4, 'mod/quiz:view', 1, 1435054425, 0),
(738, 1, 3, 'mod/quiz:view', 1, 1435054425, 0),
(739, 1, 1, 'mod/quiz:view', 1, 1435054425, 0),
(740, 1, 3, 'mod/quiz:addinstance', 1, 1435054425, 0),
(741, 1, 1, 'mod/quiz:addinstance', 1, 1435054426, 0),
(742, 1, 5, 'mod/quiz:attempt', 1, 1435054426, 0),
(743, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1435054426, 0),
(744, 1, 3, 'mod/quiz:manage', 1, 1435054426, 0),
(745, 1, 1, 'mod/quiz:manage', 1, 1435054426, 0),
(746, 1, 3, 'mod/quiz:manageoverrides', 1, 1435054426, 0),
(747, 1, 1, 'mod/quiz:manageoverrides', 1, 1435054427, 0),
(748, 1, 4, 'mod/quiz:preview', 1, 1435054427, 0),
(749, 1, 3, 'mod/quiz:preview', 1, 1435054427, 0),
(750, 1, 1, 'mod/quiz:preview', 1, 1435054427, 0),
(751, 1, 4, 'mod/quiz:grade', 1, 1435054427, 0),
(752, 1, 3, 'mod/quiz:grade', 1, 1435054427, 0),
(753, 1, 1, 'mod/quiz:grade', 1, 1435054427, 0),
(754, 1, 4, 'mod/quiz:regrade', 1, 1435054427, 0),
(755, 1, 3, 'mod/quiz:regrade', 1, 1435054427, 0),
(756, 1, 1, 'mod/quiz:regrade', 1, 1435054427, 0),
(757, 1, 4, 'mod/quiz:viewreports', 1, 1435054428, 0),
(758, 1, 3, 'mod/quiz:viewreports', 1, 1435054428, 0),
(759, 1, 1, 'mod/quiz:viewreports', 1, 1435054428, 0),
(760, 1, 3, 'mod/quiz:deleteattempts', 1, 1435054428, 0),
(761, 1, 1, 'mod/quiz:deleteattempts', 1, 1435054428, 0),
(762, 1, 6, 'mod/resource:view', 1, 1435054431, 0),
(763, 1, 7, 'mod/resource:view', 1, 1435054431, 0),
(764, 1, 3, 'mod/resource:addinstance', 1, 1435054431, 0),
(765, 1, 1, 'mod/resource:addinstance', 1, 1435054431, 0),
(766, 1, 3, 'mod/scorm:addinstance', 1, 1435054437, 0),
(767, 1, 1, 'mod/scorm:addinstance', 1, 1435054437, 0),
(768, 1, 4, 'mod/scorm:viewreport', 1, 1435054437, 0),
(769, 1, 3, 'mod/scorm:viewreport', 1, 1435054437, 0),
(770, 1, 1, 'mod/scorm:viewreport', 1, 1435054437, 0),
(771, 1, 5, 'mod/scorm:skipview', 1, 1435054438, 0),
(772, 1, 5, 'mod/scorm:savetrack', 1, 1435054438, 0),
(773, 1, 4, 'mod/scorm:savetrack', 1, 1435054438, 0),
(774, 1, 3, 'mod/scorm:savetrack', 1, 1435054438, 0),
(775, 1, 1, 'mod/scorm:savetrack', 1, 1435054438, 0),
(776, 1, 5, 'mod/scorm:viewscores', 1, 1435054438, 0),
(777, 1, 4, 'mod/scorm:viewscores', 1, 1435054438, 0),
(778, 1, 3, 'mod/scorm:viewscores', 1, 1435054438, 0),
(779, 1, 1, 'mod/scorm:viewscores', 1, 1435054438, 0),
(780, 1, 4, 'mod/scorm:deleteresponses', 1, 1435054439, 0),
(781, 1, 3, 'mod/scorm:deleteresponses', 1, 1435054439, 0),
(782, 1, 1, 'mod/scorm:deleteresponses', 1, 1435054439, 0),
(783, 1, 3, 'mod/survey:addinstance', 1, 1435054447, 0),
(784, 1, 1, 'mod/survey:addinstance', 1, 1435054447, 0),
(785, 1, 5, 'mod/survey:participate', 1, 1435054447, 0),
(786, 1, 4, 'mod/survey:participate', 1, 1435054447, 0),
(787, 1, 3, 'mod/survey:participate', 1, 1435054447, 0),
(788, 1, 1, 'mod/survey:participate', 1, 1435054447, 0),
(789, 1, 4, 'mod/survey:readresponses', 1, 1435054447, 0),
(790, 1, 3, 'mod/survey:readresponses', 1, 1435054447, 0),
(791, 1, 1, 'mod/survey:readresponses', 1, 1435054447, 0),
(792, 1, 4, 'mod/survey:download', 1, 1435054448, 0),
(793, 1, 3, 'mod/survey:download', 1, 1435054448, 0),
(794, 1, 1, 'mod/survey:download', 1, 1435054448, 0),
(795, 1, 6, 'mod/url:view', 1, 1435054449, 0),
(796, 1, 7, 'mod/url:view', 1, 1435054449, 0),
(797, 1, 3, 'mod/url:addinstance', 1, 1435054450, 0),
(798, 1, 1, 'mod/url:addinstance', 1, 1435054450, 0),
(799, 1, 3, 'mod/wiki:addinstance', 1, 1435054453, 0),
(800, 1, 1, 'mod/wiki:addinstance', 1, 1435054453, 0),
(801, 1, 6, 'mod/wiki:viewpage', 1, 1435054453, 0),
(802, 1, 5, 'mod/wiki:viewpage', 1, 1435054453, 0),
(803, 1, 4, 'mod/wiki:viewpage', 1, 1435054453, 0),
(804, 1, 3, 'mod/wiki:viewpage', 1, 1435054453, 0),
(805, 1, 1, 'mod/wiki:viewpage', 1, 1435054453, 0),
(806, 1, 5, 'mod/wiki:editpage', 1, 1435054454, 0),
(807, 1, 4, 'mod/wiki:editpage', 1, 1435054454, 0),
(808, 1, 3, 'mod/wiki:editpage', 1, 1435054454, 0),
(809, 1, 1, 'mod/wiki:editpage', 1, 1435054454, 0),
(810, 1, 5, 'mod/wiki:createpage', 1, 1435054454, 0),
(811, 1, 4, 'mod/wiki:createpage', 1, 1435054454, 0),
(812, 1, 3, 'mod/wiki:createpage', 1, 1435054454, 0),
(813, 1, 1, 'mod/wiki:createpage', 1, 1435054454, 0),
(814, 1, 5, 'mod/wiki:viewcomment', 1, 1435054454, 0),
(815, 1, 4, 'mod/wiki:viewcomment', 1, 1435054454, 0),
(816, 1, 3, 'mod/wiki:viewcomment', 1, 1435054454, 0),
(817, 1, 1, 'mod/wiki:viewcomment', 1, 1435054454, 0),
(818, 1, 5, 'mod/wiki:editcomment', 1, 1435054455, 0),
(819, 1, 4, 'mod/wiki:editcomment', 1, 1435054455, 0),
(820, 1, 3, 'mod/wiki:editcomment', 1, 1435054455, 0),
(821, 1, 1, 'mod/wiki:editcomment', 1, 1435054455, 0),
(822, 1, 4, 'mod/wiki:managecomment', 1, 1435054455, 0),
(823, 1, 3, 'mod/wiki:managecomment', 1, 1435054455, 0),
(824, 1, 1, 'mod/wiki:managecomment', 1, 1435054455, 0),
(825, 1, 4, 'mod/wiki:managefiles', 1, 1435054455, 0),
(826, 1, 3, 'mod/wiki:managefiles', 1, 1435054455, 0),
(827, 1, 1, 'mod/wiki:managefiles', 1, 1435054455, 0),
(828, 1, 4, 'mod/wiki:overridelock', 1, 1435054455, 0),
(829, 1, 3, 'mod/wiki:overridelock', 1, 1435054455, 0),
(830, 1, 1, 'mod/wiki:overridelock', 1, 1435054455, 0),
(831, 1, 4, 'mod/wiki:managewiki', 1, 1435054456, 0),
(832, 1, 3, 'mod/wiki:managewiki', 1, 1435054456, 0),
(833, 1, 1, 'mod/wiki:managewiki', 1, 1435054456, 0),
(834, 1, 6, 'mod/workshop:view', 1, 1435054466, 0),
(835, 1, 5, 'mod/workshop:view', 1, 1435054466, 0),
(836, 1, 4, 'mod/workshop:view', 1, 1435054466, 0),
(837, 1, 3, 'mod/workshop:view', 1, 1435054466, 0),
(838, 1, 1, 'mod/workshop:view', 1, 1435054466, 0),
(839, 1, 3, 'mod/workshop:addinstance', 1, 1435054466, 0),
(840, 1, 1, 'mod/workshop:addinstance', 1, 1435054466, 0),
(841, 1, 4, 'mod/workshop:switchphase', 1, 1435054467, 0),
(842, 1, 3, 'mod/workshop:switchphase', 1, 1435054467, 0),
(843, 1, 1, 'mod/workshop:switchphase', 1, 1435054467, 0),
(844, 1, 3, 'mod/workshop:editdimensions', 1, 1435054467, 0),
(845, 1, 1, 'mod/workshop:editdimensions', 1, 1435054467, 0),
(846, 1, 5, 'mod/workshop:submit', 1, 1435054467, 0),
(847, 1, 5, 'mod/workshop:peerassess', 1, 1435054467, 0),
(848, 1, 4, 'mod/workshop:manageexamples', 1, 1435054467, 0),
(849, 1, 3, 'mod/workshop:manageexamples', 1, 1435054467, 0),
(850, 1, 1, 'mod/workshop:manageexamples', 1, 1435054467, 0),
(851, 1, 4, 'mod/workshop:allocate', 1, 1435054468, 0),
(852, 1, 3, 'mod/workshop:allocate', 1, 1435054468, 0),
(853, 1, 1, 'mod/workshop:allocate', 1, 1435054468, 0),
(854, 1, 4, 'mod/workshop:publishsubmissions', 1, 1435054468, 0),
(855, 1, 3, 'mod/workshop:publishsubmissions', 1, 1435054468, 0),
(856, 1, 1, 'mod/workshop:publishsubmissions', 1, 1435054468, 0),
(857, 1, 5, 'mod/workshop:viewauthornames', 1, 1435054468, 0),
(858, 1, 4, 'mod/workshop:viewauthornames', 1, 1435054468, 0),
(859, 1, 3, 'mod/workshop:viewauthornames', 1, 1435054468, 0),
(860, 1, 1, 'mod/workshop:viewauthornames', 1, 1435054469, 0),
(861, 1, 4, 'mod/workshop:viewreviewernames', 1, 1435054469, 0),
(862, 1, 3, 'mod/workshop:viewreviewernames', 1, 1435054469, 0),
(863, 1, 1, 'mod/workshop:viewreviewernames', 1, 1435054469, 0),
(864, 1, 4, 'mod/workshop:viewallsubmissions', 1, 1435054469, 0),
(865, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1435054469, 0),
(866, 1, 1, 'mod/workshop:viewallsubmissions', 1, 1435054469, 0),
(867, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1435054469, 0),
(868, 1, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1435054469, 0),
(869, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1435054469, 0),
(870, 1, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1435054469, 0),
(871, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1435054470, 0),
(872, 1, 4, 'mod/workshop:viewauthorpublished', 1, 1435054470, 0),
(873, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1435054470, 0),
(874, 1, 1, 'mod/workshop:viewauthorpublished', 1, 1435054470, 0),
(875, 1, 4, 'mod/workshop:viewallassessments', 1, 1435054470, 0),
(876, 1, 3, 'mod/workshop:viewallassessments', 1, 1435054470, 0),
(877, 1, 1, 'mod/workshop:viewallassessments', 1, 1435054470, 0),
(878, 1, 4, 'mod/workshop:overridegrades', 1, 1435054470, 0),
(879, 1, 3, 'mod/workshop:overridegrades', 1, 1435054470, 0),
(880, 1, 1, 'mod/workshop:overridegrades', 1, 1435054470, 0),
(881, 1, 4, 'mod/workshop:ignoredeadlines', 1, 1435054471, 0),
(882, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1435054471, 0),
(883, 1, 1, 'mod/workshop:ignoredeadlines', 1, 1435054471, 0),
(884, 1, 1, 'enrol/category:config', 1, 1435054490, 0),
(885, 1, 3, 'enrol/category:config', 1, 1435054490, 0),
(886, 1, 3, 'enrol/cohort:config', 1, 1435054491, 0),
(887, 1, 1, 'enrol/cohort:config', 1, 1435054491, 0),
(888, 1, 1, 'enrol/cohort:unenrol', 1, 1435054491, 0),
(889, 1, 1, 'enrol/database:unenrol', 1, 1435054491, 0),
(890, 1, 1, 'enrol/database:config', 1, 1435054492, 0),
(891, 1, 3, 'enrol/database:config', 1, 1435054492, 0),
(892, 1, 1, 'enrol/guest:config', 1, 1435054494, 0),
(893, 1, 3, 'enrol/guest:config', 1, 1435054494, 0),
(894, 1, 1, 'enrol/imsenterprise:config', 1, 1435054495, 0);
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(895, 1, 3, 'enrol/imsenterprise:config', 1, 1435054495, 0),
(896, 1, 1, 'enrol/ldap:manage', 1, 1435054496, 0),
(897, 1, 1, 'enrol/manual:config', 1, 1435054497, 0),
(898, 1, 1, 'enrol/manual:enrol', 1, 1435054497, 0),
(899, 1, 3, 'enrol/manual:enrol', 1, 1435054497, 0),
(900, 1, 1, 'enrol/manual:manage', 1, 1435054497, 0),
(901, 1, 3, 'enrol/manual:manage', 1, 1435054497, 0),
(902, 1, 1, 'enrol/manual:unenrol', 1, 1435054497, 0),
(903, 1, 3, 'enrol/manual:unenrol', 1, 1435054497, 0),
(904, 1, 1, 'enrol/meta:config', 1, 1435054498, 0),
(905, 1, 3, 'enrol/meta:config', 1, 1435054499, 0),
(906, 1, 1, 'enrol/meta:selectaslinked', 1, 1435054499, 0),
(907, 1, 1, 'enrol/meta:unenrol', 1, 1435054499, 0),
(908, 1, 1, 'enrol/mnet:config', 1, 1435054499, 0),
(909, 1, 3, 'enrol/mnet:config', 1, 1435054499, 0),
(910, 1, 1, 'enrol/paypal:config', 1, 1435054510, 0),
(911, 1, 1, 'enrol/paypal:manage', 1, 1435054510, 0),
(912, 1, 3, 'enrol/paypal:manage', 1, 1435054510, 0),
(913, 1, 1, 'enrol/paypal:unenrol', 1, 1435054510, 0),
(914, 1, 3, 'enrol/self:config', 1, 1435054512, 0),
(915, 1, 1, 'enrol/self:config', 1, 1435054512, 0),
(916, 1, 3, 'enrol/self:manage', 1, 1435054512, 0),
(917, 1, 1, 'enrol/self:manage', 1, 1435054512, 0),
(918, 1, 1, 'enrol/self:holdkey', -1000, 1435054512, 0),
(919, 1, 5, 'enrol/self:unenrolself', 1, 1435054512, 0),
(920, 1, 3, 'enrol/self:unenrol', 1, 1435054513, 0),
(921, 1, 1, 'enrol/self:unenrol', 1, 1435054513, 0),
(922, 1, 7, 'message/airnotifier:managedevice', 1, 1435054515, 0),
(923, 1, 3, 'block/activity_modules:addinstance', 1, 1435054524, 0),
(924, 1, 1, 'block/activity_modules:addinstance', 1, 1435054524, 0),
(925, 1, 3, 'block/activity_results:addinstance', 1, 1435054524, 0),
(926, 1, 1, 'block/activity_results:addinstance', 1, 1435054525, 0),
(927, 1, 7, 'block/admin_bookmarks:myaddinstance', 1, 1435054525, 0),
(928, 1, 3, 'block/admin_bookmarks:addinstance', 1, 1435054526, 0),
(929, 1, 1, 'block/admin_bookmarks:addinstance', 1, 1435054526, 0),
(930, 1, 3, 'block/badges:addinstance', 1, 1435054526, 0),
(931, 1, 1, 'block/badges:addinstance', 1, 1435054526, 0),
(932, 1, 7, 'block/badges:myaddinstance', 1, 1435054527, 0),
(933, 1, 3, 'block/blog_menu:addinstance', 1, 1435054527, 0),
(934, 1, 1, 'block/blog_menu:addinstance', 1, 1435054527, 0),
(935, 1, 3, 'block/blog_recent:addinstance', 1, 1435054528, 0),
(936, 1, 1, 'block/blog_recent:addinstance', 1, 1435054528, 0),
(937, 1, 3, 'block/blog_tags:addinstance', 1, 1435054529, 0),
(938, 1, 1, 'block/blog_tags:addinstance', 1, 1435054529, 0),
(939, 1, 7, 'block/calendar_month:myaddinstance', 1, 1435054530, 0),
(940, 1, 3, 'block/calendar_month:addinstance', 1, 1435054530, 0),
(941, 1, 1, 'block/calendar_month:addinstance', 1, 1435054530, 0),
(942, 1, 7, 'block/calendar_upcoming:myaddinstance', 1, 1435054530, 0),
(943, 1, 3, 'block/calendar_upcoming:addinstance', 1, 1435054531, 0),
(944, 1, 1, 'block/calendar_upcoming:addinstance', 1, 1435054531, 0),
(945, 1, 7, 'block/comments:myaddinstance', 1, 1435054531, 0),
(946, 1, 3, 'block/comments:addinstance', 1, 1435054531, 0),
(947, 1, 1, 'block/comments:addinstance', 1, 1435054531, 0),
(948, 1, 7, 'block/community:myaddinstance', 1, 1435054532, 0),
(949, 1, 3, 'block/community:addinstance', 1, 1435054532, 0),
(950, 1, 1, 'block/community:addinstance', 1, 1435054533, 0),
(951, 1, 3, 'block/completionstatus:addinstance', 1, 1435054533, 0),
(952, 1, 1, 'block/completionstatus:addinstance', 1, 1435054533, 0),
(953, 1, 7, 'block/course_list:myaddinstance', 1, 1435054534, 0),
(954, 1, 3, 'block/course_list:addinstance', 1, 1435054534, 0),
(955, 1, 1, 'block/course_list:addinstance', 1, 1435054534, 0),
(956, 1, 7, 'block/course_overview:myaddinstance', 1, 1435054535, 0),
(957, 1, 3, 'block/course_overview:addinstance', 1, 1435054535, 0),
(958, 1, 1, 'block/course_overview:addinstance', 1, 1435054535, 0),
(959, 1, 3, 'block/course_summary:addinstance', 1, 1435054536, 0),
(960, 1, 1, 'block/course_summary:addinstance', 1, 1435054536, 0),
(961, 1, 3, 'block/feedback:addinstance', 1, 1435054537, 0),
(962, 1, 1, 'block/feedback:addinstance', 1, 1435054537, 0),
(963, 1, 7, 'block/glossary_random:myaddinstance', 1, 1435054537, 0),
(964, 1, 3, 'block/glossary_random:addinstance', 1, 1435054538, 0),
(965, 1, 1, 'block/glossary_random:addinstance', 1, 1435054538, 0),
(966, 1, 7, 'block/html:myaddinstance', 1, 1435054538, 0),
(967, 1, 3, 'block/html:addinstance', 1, 1435054538, 0),
(968, 1, 1, 'block/html:addinstance', 1, 1435054539, 0),
(969, 1, 3, 'block/login:addinstance', 1, 1435054539, 0),
(970, 1, 1, 'block/login:addinstance', 1, 1435054539, 0),
(971, 1, 7, 'block/mentees:myaddinstance', 1, 1435054540, 0),
(972, 1, 3, 'block/mentees:addinstance', 1, 1435054540, 0),
(973, 1, 1, 'block/mentees:addinstance', 1, 1435054540, 0),
(974, 1, 7, 'block/messages:myaddinstance', 1, 1435054541, 0),
(975, 1, 3, 'block/messages:addinstance', 1, 1435054541, 0),
(976, 1, 1, 'block/messages:addinstance', 1, 1435054541, 0),
(977, 1, 7, 'block/mnet_hosts:myaddinstance', 1, 1435054542, 0),
(978, 1, 3, 'block/mnet_hosts:addinstance', 1, 1435054542, 0),
(979, 1, 1, 'block/mnet_hosts:addinstance', 1, 1435054542, 0),
(980, 1, 7, 'block/myprofile:myaddinstance', 1, 1435054543, 0),
(981, 1, 3, 'block/myprofile:addinstance', 1, 1435054543, 0),
(982, 1, 1, 'block/myprofile:addinstance', 1, 1435054543, 0),
(983, 1, 7, 'block/navigation:myaddinstance', 1, 1435054544, 0),
(984, 1, 3, 'block/navigation:addinstance', 1, 1435054544, 0),
(985, 1, 1, 'block/navigation:addinstance', 1, 1435054544, 0),
(986, 1, 7, 'block/news_items:myaddinstance', 1, 1435054544, 0),
(987, 1, 3, 'block/news_items:addinstance', 1, 1435054545, 0),
(988, 1, 1, 'block/news_items:addinstance', 1, 1435054545, 0),
(989, 1, 7, 'block/online_users:myaddinstance', 1, 1435054545, 0),
(990, 1, 3, 'block/online_users:addinstance', 1, 1435054545, 0),
(991, 1, 1, 'block/online_users:addinstance', 1, 1435054545, 0),
(992, 1, 7, 'block/online_users:viewlist', 1, 1435054546, 0),
(993, 1, 6, 'block/online_users:viewlist', 1, 1435054546, 0),
(994, 1, 5, 'block/online_users:viewlist', 1, 1435054546, 0),
(995, 1, 4, 'block/online_users:viewlist', 1, 1435054546, 0),
(996, 1, 3, 'block/online_users:viewlist', 1, 1435054546, 0),
(997, 1, 1, 'block/online_users:viewlist', 1, 1435054546, 0),
(998, 1, 3, 'block/participants:addinstance', 1, 1435054547, 0),
(999, 1, 1, 'block/participants:addinstance', 1, 1435054547, 0),
(1000, 1, 7, 'block/private_files:myaddinstance', 1, 1435054549, 0),
(1001, 1, 3, 'block/private_files:addinstance', 1, 1435054549, 0),
(1002, 1, 1, 'block/private_files:addinstance', 1, 1435054549, 0),
(1003, 1, 3, 'block/quiz_results:addinstance', 1, 1435054550, 0),
(1004, 1, 1, 'block/quiz_results:addinstance', 1, 1435054550, 0),
(1005, 1, 3, 'block/recent_activity:addinstance', 1, 1435054551, 0),
(1006, 1, 1, 'block/recent_activity:addinstance', 1, 1435054551, 0),
(1007, 1, 7, 'block/recent_activity:viewaddupdatemodule', 1, 1435054551, 0),
(1008, 1, 7, 'block/recent_activity:viewdeletemodule', 1, 1435054551, 0),
(1009, 1, 7, 'block/rss_client:myaddinstance', 1, 1435054553, 0),
(1010, 1, 3, 'block/rss_client:addinstance', 1, 1435054553, 0),
(1011, 1, 1, 'block/rss_client:addinstance', 1, 1435054553, 0),
(1012, 1, 4, 'block/rss_client:manageownfeeds', 1, 1435054553, 0),
(1013, 1, 3, 'block/rss_client:manageownfeeds', 1, 1435054553, 0),
(1014, 1, 1, 'block/rss_client:manageownfeeds', 1, 1435054553, 0),
(1015, 1, 1, 'block/rss_client:manageanyfeeds', 1, 1435054553, 0),
(1016, 1, 3, 'block/search_forums:addinstance', 1, 1435054554, 0),
(1017, 1, 1, 'block/search_forums:addinstance', 1, 1435054554, 0),
(1018, 1, 3, 'block/section_links:addinstance', 1, 1435054555, 0),
(1019, 1, 1, 'block/section_links:addinstance', 1, 1435054555, 0),
(1020, 1, 3, 'block/selfcompletion:addinstance', 1, 1435054555, 0),
(1021, 1, 1, 'block/selfcompletion:addinstance', 1, 1435054555, 0),
(1022, 1, 7, 'block/settings:myaddinstance', 1, 1435054556, 0),
(1023, 1, 3, 'block/settings:addinstance', 1, 1435054556, 0),
(1024, 1, 1, 'block/settings:addinstance', 1, 1435054556, 0),
(1025, 1, 3, 'block/site_main_menu:addinstance', 1, 1435054557, 0),
(1026, 1, 1, 'block/site_main_menu:addinstance', 1, 1435054557, 0),
(1027, 1, 3, 'block/social_activities:addinstance', 1, 1435054558, 0),
(1028, 1, 1, 'block/social_activities:addinstance', 1, 1435054558, 0),
(1029, 1, 3, 'block/tag_flickr:addinstance', 1, 1435054560, 0),
(1030, 1, 1, 'block/tag_flickr:addinstance', 1, 1435054561, 0),
(1031, 1, 3, 'block/tag_youtube:addinstance', 1, 1435054562, 0),
(1032, 1, 1, 'block/tag_youtube:addinstance', 1, 1435054562, 0),
(1033, 1, 7, 'block/tags:myaddinstance', 1, 1435054563, 0),
(1034, 1, 3, 'block/tags:addinstance', 1, 1435054563, 0),
(1035, 1, 1, 'block/tags:addinstance', 1, 1435054563, 0),
(1036, 1, 4, 'report/completion:view', 1, 1435054582, 0),
(1037, 1, 3, 'report/completion:view', 1, 1435054582, 0),
(1038, 1, 1, 'report/completion:view', 1, 1435054582, 0),
(1039, 1, 4, 'report/courseoverview:view', 1, 1435054583, 0),
(1040, 1, 3, 'report/courseoverview:view', 1, 1435054583, 0),
(1041, 1, 1, 'report/courseoverview:view', 1, 1435054583, 0),
(1042, 1, 4, 'report/log:view', 1, 1435054584, 0),
(1043, 1, 3, 'report/log:view', 1, 1435054585, 0),
(1044, 1, 1, 'report/log:view', 1, 1435054585, 0),
(1045, 1, 4, 'report/log:viewtoday', 1, 1435054585, 0),
(1046, 1, 3, 'report/log:viewtoday', 1, 1435054585, 0),
(1047, 1, 1, 'report/log:viewtoday', 1, 1435054585, 0),
(1048, 1, 4, 'report/loglive:view', 1, 1435054586, 0),
(1049, 1, 3, 'report/loglive:view', 1, 1435054586, 0),
(1050, 1, 1, 'report/loglive:view', 1, 1435054586, 0),
(1051, 1, 4, 'report/outline:view', 1, 1435054587, 0),
(1052, 1, 3, 'report/outline:view', 1, 1435054587, 0),
(1053, 1, 1, 'report/outline:view', 1, 1435054587, 0),
(1054, 1, 4, 'report/participation:view', 1, 1435054587, 0),
(1055, 1, 3, 'report/participation:view', 1, 1435054587, 0),
(1056, 1, 1, 'report/participation:view', 1, 1435054587, 0),
(1057, 1, 1, 'report/performance:view', 1, 1435054588, 0),
(1058, 1, 4, 'report/progress:view', 1, 1435054589, 0),
(1059, 1, 3, 'report/progress:view', 1, 1435054589, 0),
(1060, 1, 1, 'report/progress:view', 1, 1435054589, 0),
(1061, 1, 1, 'report/security:view', 1, 1435054590, 0),
(1062, 1, 4, 'report/stats:view', 1, 1435054591, 0),
(1063, 1, 3, 'report/stats:view', 1, 1435054591, 0),
(1064, 1, 1, 'report/stats:view', 1, 1435054591, 0),
(1065, 1, 6, 'report/usersessions:manageownsessions', -1000, 1435054592, 0),
(1066, 1, 7, 'report/usersessions:manageownsessions', 1, 1435054592, 0),
(1067, 1, 1, 'report/usersessions:manageownsessions', 1, 1435054592, 0),
(1068, 1, 4, 'gradeexport/ods:view', 1, 1435054592, 0),
(1069, 1, 3, 'gradeexport/ods:view', 1, 1435054593, 0),
(1070, 1, 1, 'gradeexport/ods:view', 1, 1435054593, 0),
(1071, 1, 1, 'gradeexport/ods:publish', 1, 1435054593, 0),
(1072, 1, 4, 'gradeexport/txt:view', 1, 1435054593, 0),
(1073, 1, 3, 'gradeexport/txt:view', 1, 1435054593, 0),
(1074, 1, 1, 'gradeexport/txt:view', 1, 1435054593, 0),
(1075, 1, 1, 'gradeexport/txt:publish', 1, 1435054594, 0),
(1076, 1, 4, 'gradeexport/xls:view', 1, 1435054594, 0),
(1077, 1, 3, 'gradeexport/xls:view', 1, 1435054594, 0),
(1078, 1, 1, 'gradeexport/xls:view', 1, 1435054594, 0),
(1079, 1, 1, 'gradeexport/xls:publish', 1, 1435054594, 0),
(1080, 1, 4, 'gradeexport/xml:view', 1, 1435054595, 0),
(1081, 1, 3, 'gradeexport/xml:view', 1, 1435054595, 0),
(1082, 1, 1, 'gradeexport/xml:view', 1, 1435054595, 0),
(1083, 1, 1, 'gradeexport/xml:publish', 1, 1435054595, 0),
(1084, 1, 3, 'gradeimport/csv:view', 1, 1435054596, 0),
(1085, 1, 1, 'gradeimport/csv:view', 1, 1435054596, 0),
(1086, 1, 3, 'gradeimport/direct:view', 1, 1435054596, 0),
(1087, 1, 1, 'gradeimport/direct:view', 1, 1435054596, 0),
(1088, 1, 3, 'gradeimport/xml:view', 1, 1435054597, 0),
(1089, 1, 1, 'gradeimport/xml:view', 1, 1435054597, 0),
(1090, 1, 1, 'gradeimport/xml:publish', 1, 1435054597, 0),
(1091, 1, 4, 'gradereport/grader:view', 1, 1435054598, 0),
(1092, 1, 3, 'gradereport/grader:view', 1, 1435054598, 0),
(1093, 1, 1, 'gradereport/grader:view', 1, 1435054598, 0),
(1094, 1, 4, 'gradereport/history:view', 1, 1435054598, 0),
(1095, 1, 3, 'gradereport/history:view', 1, 1435054598, 0),
(1096, 1, 1, 'gradereport/history:view', 1, 1435054599, 0),
(1097, 1, 4, 'gradereport/outcomes:view', 1, 1435054599, 0),
(1098, 1, 3, 'gradereport/outcomes:view', 1, 1435054599, 0),
(1099, 1, 1, 'gradereport/outcomes:view', 1, 1435054599, 0),
(1100, 1, 5, 'gradereport/overview:view', 1, 1435054600, 0),
(1101, 1, 1, 'gradereport/overview:view', 1, 1435054600, 0),
(1102, 1, 3, 'gradereport/singleview:view', 1, 1435054600, 0),
(1103, 1, 1, 'gradereport/singleview:view', 1, 1435054600, 0),
(1104, 1, 5, 'gradereport/user:view', 1, 1435054601, 0),
(1105, 1, 4, 'gradereport/user:view', 1, 1435054601, 0),
(1106, 1, 3, 'gradereport/user:view', 1, 1435054601, 0),
(1107, 1, 1, 'gradereport/user:view', 1, 1435054601, 0),
(1108, 1, 7, 'repository/alfresco:view', 1, 1435054614, 0),
(1109, 1, 7, 'repository/areafiles:view', 1, 1435054615, 0),
(1110, 1, 7, 'repository/boxnet:view', 1, 1435054616, 0),
(1111, 1, 2, 'repository/coursefiles:view', 1, 1435054616, 0),
(1112, 1, 4, 'repository/coursefiles:view', 1, 1435054616, 0),
(1113, 1, 3, 'repository/coursefiles:view', 1, 1435054616, 0),
(1114, 1, 1, 'repository/coursefiles:view', 1, 1435054616, 0),
(1115, 1, 7, 'repository/dropbox:view', 1, 1435054617, 0),
(1116, 1, 7, 'repository/equella:view', 1, 1435054618, 0),
(1117, 1, 2, 'repository/filesystem:view', 1, 1435054618, 0),
(1118, 1, 4, 'repository/filesystem:view', 1, 1435054618, 0),
(1119, 1, 3, 'repository/filesystem:view', 1, 1435054618, 0),
(1120, 1, 1, 'repository/filesystem:view', 1, 1435054618, 0),
(1121, 1, 7, 'repository/flickr:view', 1, 1435054619, 0),
(1122, 1, 7, 'repository/flickr_public:view', 1, 1435054620, 0),
(1123, 1, 7, 'repository/googledocs:view', 1, 1435054620, 0),
(1124, 1, 2, 'repository/local:view', 1, 1435054621, 0),
(1125, 1, 4, 'repository/local:view', 1, 1435054622, 0),
(1126, 1, 3, 'repository/local:view', 1, 1435054622, 0),
(1127, 1, 1, 'repository/local:view', 1, 1435054622, 0),
(1128, 1, 7, 'repository/merlot:view', 1, 1435054622, 0),
(1129, 1, 7, 'repository/picasa:view', 1, 1435054623, 0),
(1130, 1, 7, 'repository/recent:view', 1, 1435054624, 0),
(1131, 1, 7, 'repository/s3:view', 1, 1435054625, 0),
(1132, 1, 7, 'repository/skydrive:view', 1, 1435054625, 0),
(1133, 1, 7, 'repository/upload:view', 1, 1435054626, 0),
(1134, 1, 7, 'repository/url:view', 1, 1435054627, 0),
(1135, 1, 7, 'repository/user:view', 1, 1435054628, 0),
(1136, 1, 2, 'repository/webdav:view', 1, 1435054629, 0),
(1137, 1, 4, 'repository/webdav:view', 1, 1435054629, 0),
(1138, 1, 3, 'repository/webdav:view', 1, 1435054629, 0),
(1139, 1, 1, 'repository/webdav:view', 1, 1435054629, 0),
(1140, 1, 7, 'repository/wikimedia:view', 1, 1435054630, 0),
(1141, 1, 7, 'repository/youtube:view', 1, 1435054631, 0),
(1142, 1, 1, 'tool/customlang:view', 1, 1435054649, 0),
(1143, 1, 1, 'tool/customlang:edit', 1, 1435054649, 0),
(1144, 1, 4, 'tool/monitor:subscribe', 1, 1435054658, 0),
(1145, 1, 3, 'tool/monitor:subscribe', 1, 1435054658, 0),
(1146, 1, 1, 'tool/monitor:subscribe', 1, 1435054658, 0),
(1147, 1, 4, 'tool/monitor:managerules', 1, 1435054658, 0),
(1148, 1, 3, 'tool/monitor:managerules', 1, 1435054658, 0),
(1149, 1, 1, 'tool/monitor:managerules', 1, 1435054658, 0),
(1150, 1, 1, 'tool/monitor:managetool', 1, 1435054659, 0),
(1151, 1, 1, 'tool/uploaduser:uploaduserpictures', 1, 1435054667, 0),
(1152, 1, 3, 'booktool/importhtml:import', 1, 1435054689, 0),
(1153, 1, 1, 'booktool/importhtml:import', 1, 1435054689, 0),
(1154, 1, 6, 'booktool/print:print', 1, 1435054689, 0),
(1155, 1, 8, 'booktool/print:print', 1, 1435054690, 0),
(1156, 1, 5, 'booktool/print:print', 1, 1435054690, 0),
(1157, 1, 4, 'booktool/print:print', 1, 1435054690, 0),
(1158, 1, 3, 'booktool/print:print', 1, 1435054690, 0),
(1159, 1, 1, 'booktool/print:print', 1, 1435054690, 0),
(1160, 1, 4, 'quiz/grading:viewstudentnames', 1, 1435054699, 0),
(1161, 1, 3, 'quiz/grading:viewstudentnames', 1, 1435054699, 0),
(1162, 1, 1, 'quiz/grading:viewstudentnames', 1, 1435054699, 0),
(1163, 1, 4, 'quiz/grading:viewidnumber', 1, 1435054699, 0),
(1164, 1, 3, 'quiz/grading:viewidnumber', 1, 1435054699, 0),
(1165, 1, 1, 'quiz/grading:viewidnumber', 1, 1435054699, 0),
(1166, 1, 4, 'quiz/statistics:view', 1, 1435054702, 0),
(1167, 1, 3, 'quiz/statistics:view', 1, 1435054702, 0),
(1168, 1, 1, 'quiz/statistics:view', 1, 1435054702, 0),
(1169, 1, 7, 'block/faces:myaddinstance', 1, 1436925332, 2),
(1170, 1, 3, 'block/faces:addinstance', 1, 1436925333, 2),
(1171, 1, 1, 'block/faces:addinstance', 1, 1436925333, 2),
(1172, 1, 7, 'block/font_recents:myaddinstance', 1, 1436925335, 2),
(1173, 1, 3, 'block/font_recents:addinstance', 1, 1436925335, 2),
(1174, 1, 1, 'block/font_recents:addinstance', 1, 1436925335, 2),
(1175, 1, 7, 'block/slideshow:myaddinstance', 1, 1436945641, 2),
(1176, 1, 3, 'block/slideshow:addinstance', 1, 1436945641, 2),
(1177, 1, 1, 'block/slideshow:addinstance', 1, 1436945641, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_context_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Lists which roles can be assigned at which context levels. T' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_role_context_levels`
--

INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(1, 1, 10),
(4, 2, 10),
(2, 1, 40),
(5, 2, 40),
(3, 1, 50),
(6, 3, 50),
(8, 4, 50),
(10, 5, 50),
(7, 3, 70),
(9, 4, 70),
(11, 5, 70);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_names`
--

CREATE TABLE IF NOT EXISTS `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='role names in native strings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_sortorder`
--

CREATE TABLE IF NOT EXISTS `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sort order of course managers in a course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale`
--

CREATE TABLE IF NOT EXISTS `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Defines grading scales' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_scale`
--

INSERT INTO `mdl_scale` (`id`, `courseid`, `userid`, `name`, `scale`, `description`, `descriptionformat`, `timemodified`) VALUES
(1, 0, 0, 'Separate and Connected ways of knowing', 'Mostly separate knowing,Separate and connected,Mostly connected knowing', 'The scale based on the theory of separate and connected knowing. This theory describes two different ways that we can evaluate and learn about the things we see and hear.<ul><li><strong>Separate knowers</strong> remain as objective as possible without including feelings and emotions. In a discussion with other people, they like to defend their own ideas, using logic to find holes in opponent''s ideas.</li><li><strong>Connected knowers</strong> are more sensitive to other people. They are skilled at empathy and tends to listen and ask questions until they feel they can connect and "understand things from their point of view". They learn by trying to share the experiences that led to the knowledge they find in other people.</li></ul>', 0, 1436952481);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale_history`
--

CREATE TABLE IF NOT EXISTS `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scormtype` varchar(50) NOT NULL DEFAULT 'local',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) DEFAULT NULL,
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint(10) DEFAULT '-100',
  `navpositiontop` bigint(10) DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  `displayactivityname` smallint(4) NOT NULL DEFAULT '1',
  `autocommit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each table is one SCORM module and its configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_aicc_session`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) DEFAULT NULL,
  `scormstatus` varchar(255) DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) DEFAULT NULL,
  `sessiontime` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by AICC HACP to store session information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `parent` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `launch` longtext NOT NULL,
  `scormtype` varchar(5) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each SCO part of the SCORM module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_data`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains variable data get from packages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_track`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to track SCOes' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective mapinfo description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_objective`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `action` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule condition' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule conditions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) DEFAULT NULL,
  `lastip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Database based session storage - now recommended' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_sessions`
--

INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(6, 0, 'kghfp2neqgfhfon67aukovo2u5', 2, NULL, 1435130895, 1435149864, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1'),
(8, 0, 'qqga8haqdlv9a36lrvgp7upu23', 2, NULL, 1435144368, 1435144369, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1'),
(9, 0, '7hau7pkcb1mesasui201v9fbd3', 0, NULL, 1436876854, 1436876858, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1'),
(11, 0, 'uvkspsqi9l2r6p5onjuroc95i1', 2, NULL, 1436925242, 1436958110, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to accumulate daily stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate daily stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey`
--

CREATE TABLE IF NOT EXISTS `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Each record is one SURVEY module with its configuration' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_survey`
--

INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44'),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44'),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44'),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68'),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='text about each survey submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext NOT NULL,
  `answer2` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the answers to each questions filled by the users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_questions`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL DEFAULT '',
  `shorttext` varchar(30) NOT NULL DEFAULT '',
  `multi` varchar(100) NOT NULL DEFAULT '',
  `intro` varchar(50) NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='the questions conforming one survey' AUTO_INCREMENT=74 ;

--
-- Dumping data for table `mdl_survey_questions`
--

INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag`
--

CREATE TABLE IF NOT EXISTS `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `rawname` varchar(255) NOT NULL DEFAULT '',
  `tagtype` varchar(255) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  UNIQUE KEY `mdl_tag_idnam_uix` (`id`,`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag table - this generic table will replace the old "tags" t' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_correlation`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The rationale for the ''tag_correlation'' table is performance' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `component` varchar(100) DEFAULT NULL,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `contextid` bigint(10) DEFAULT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `mdl_taginst_tag_ix` (`tagid`),
  KEY `mdl_taginst_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tag_instance table holds the information of associations bet' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_task_adhoc`
--

CREATE TABLE IF NOT EXISTS `mdl_task_adhoc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL DEFAULT '',
  `classname` varchar(255) NOT NULL DEFAULT '',
  `nextruntime` bigint(10) NOT NULL,
  `faildelay` bigint(10) DEFAULT NULL,
  `customdata` longtext,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_taskadho_nex_ix` (`nextruntime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of adhoc tasks waiting to run.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_task_scheduled`
--

CREATE TABLE IF NOT EXISTS `mdl_task_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL DEFAULT '',
  `classname` varchar(255) NOT NULL DEFAULT '',
  `lastruntime` bigint(10) DEFAULT NULL,
  `nextruntime` bigint(10) DEFAULT NULL,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  `minute` varchar(25) NOT NULL DEFAULT '',
  `hour` varchar(25) NOT NULL DEFAULT '',
  `day` varchar(25) NOT NULL DEFAULT '',
  `month` varchar(25) NOT NULL DEFAULT '',
  `dayofweek` varchar(25) NOT NULL DEFAULT '',
  `faildelay` bigint(10) DEFAULT NULL,
  `customised` tinyint(2) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tasksche_cla_uix` (`classname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of scheduled tasks to be run by cron.' AUTO_INCREMENT=38 ;

--
-- Dumping data for table `mdl_task_scheduled`
--

INSERT INTO `mdl_task_scheduled` (`id`, `component`, `classname`, `lastruntime`, `nextruntime`, `blocking`, `minute`, `hour`, `day`, `month`, `dayofweek`, `faildelay`, `customised`, `disabled`) VALUES
(1, 'moodle', '\\core\\task\\session_cleanup_task', 0, 1435054260, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(2, 'moodle', '\\core\\task\\delete_unconfirmed_users_task', 0, 1435057200, 0, '0', '*', '*', '*', '*', 0, 0, 0),
(3, 'moodle', '\\core\\task\\delete_incomplete_users_task', 0, 1435057500, 0, '5', '*', '*', '*', '*', 0, 0, 0),
(4, 'moodle', '\\core\\task\\backup_cleanup_task', 0, 1435057800, 0, '10', '*', '*', '*', '*', 0, 0, 0),
(5, 'moodle', '\\core\\task\\tag_cron_task', 0, 1435054800, 0, '20', '*', '*', '*', '*', 0, 0, 0),
(6, 'moodle', '\\core\\task\\context_cleanup_task', 0, 1435055100, 0, '25', '*', '*', '*', '*', 0, 0, 0),
(7, 'moodle', '\\core\\task\\cache_cleanup_task', 0, 1435055400, 0, '30', '*', '*', '*', '*', 0, 0, 0),
(8, 'moodle', '\\core\\task\\messaging_cleanup_task', 0, 1435055700, 0, '35', '*', '*', '*', '*', 0, 0, 0),
(9, 'moodle', '\\core\\task\\send_new_user_passwords_task', 0, 1435054260, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(10, 'moodle', '\\core\\task\\send_failed_login_notifications_task', 0, 1435054260, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(11, 'moodle', '\\core\\task\\create_contexts_task', 0, 1435096800, 1, '0', '0', '*', '*', '*', 0, 0, 0),
(12, 'moodle', '\\core\\task\\legacy_plugin_cron_task', 0, 1435054260, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(13, 'moodle', '\\core\\task\\grade_cron_task', 0, 1435054260, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(14, 'moodle', '\\core\\task\\events_cron_task', 0, 1435054260, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(15, 'moodle', '\\core\\task\\completion_cron_task', 0, 1435054260, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(16, 'moodle', '\\core\\task\\portfolio_cron_task', 0, 1435054260, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(17, 'moodle', '\\core\\task\\plagiarism_cron_task', 0, 1435054260, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(18, 'moodle', '\\core\\task\\calendar_cron_task', 0, 1435054260, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(19, 'moodle', '\\core\\task\\blog_cron_task', 0, 1435054260, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(20, 'moodle', '\\core\\task\\question_cron_task', 0, 1435054260, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(21, 'moodle', '\\core\\task\\registration_cron_task', 0, 1435424940, 0, '9', '19', '*', '*', '6', 0, 0, 0),
(22, 'moodle', '\\core\\task\\check_for_updates_task', 0, 1435060800, 0, '0', '*/2', '*', '*', '*', 0, 0, 0),
(23, 'moodle', '\\core\\task\\cache_cron_task', 0, 1435056600, 0, '50', '*', '*', '*', '*', 0, 0, 0),
(24, 'moodle', '\\core\\task\\automated_backup_task', 0, 1435056600, 0, '50', '*', '*', '*', '*', 0, 0, 0),
(25, 'moodle', '\\core\\task\\badges_cron_task', 0, 1435054500, 0, '*/5', '*', '*', '*', '*', 0, 0, 0),
(26, 'moodle', '\\core\\task\\file_temp_cleanup_task', 0, 1435056900, 0, '55', '*/6', '*', '*', '*', 0, 0, 0),
(27, 'moodle', '\\core\\task\\file_trash_cleanup_task', 0, 1435056900, 0, '55', '*/6', '*', '*', '*', 0, 0, 0),
(28, 'moodle', '\\core\\task\\stats_cron_task', 0, 1435057200, 0, '0', '*', '*', '*', '*', 0, 0, 0),
(29, 'moodle', '\\core\\task\\password_reset_cleanup_task', 0, 1435075200, 0, '0', '*/6', '*', '*', '*', 0, 0, 0),
(30, 'mod_forum', '\\mod_forum\\task\\cron_task', 0, 1435054440, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(31, 'enrol_imsenterprise', '\\enrol_imsenterprise\\task\\cron_task', 0, 1435057800, 0, '10', '*', '*', '*', '*', 0, 0, 0),
(32, 'tool_langimport', '\\tool_langimport\\task\\update_langpacks_task', 0, 1435112280, 0, '18', '4', '*', '*', '*', 0, 0, 0),
(33, 'tool_messageinbound', '\\tool_messageinbound\\task\\pickup_task', 0, 1435054680, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(34, 'tool_messageinbound', '\\tool_messageinbound\\task\\cleanup_task', 0, 1435103700, 0, '55', '1', '*', '*', '*', 0, 0, 0),
(35, 'tool_monitor', '\\tool_monitor\\task\\clean_events', 0, 1435054680, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(36, 'logstore_legacy', '\\logstore_legacy\\task\\cleanup_task', 0, 1435116000, 0, '*', '5', '*', '*', '*', 0, 0, 0),
(37, 'logstore_standard', '\\logstore_standard\\task\\cleanup_task', 0, 1435112400, 0, '*', '4', '*', '*', '*', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) NOT NULL DEFAULT '',
  `original` longtext NOT NULL,
  `master` longtext,
  `local` longtext,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the working checkout of all strings and their custo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang_components`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the list of all installed plugins that provide thei' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_events`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_events` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(254) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `link` varchar(254) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A table that keeps a log of events related to subscriptions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_history`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timesent` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolmonihist_sidusetim_uix` (`sid`,`userid`,`timesent`),
  KEY `mdl_toolmonihist_sid_ix` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store history of message notifications sent' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_rules`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_rules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `descriptionformat` tinyint(1) NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `plugin` varchar(254) NOT NULL DEFAULT '',
  `eventname` varchar(254) NOT NULL DEFAULT '',
  `template` longtext NOT NULL,
  `templateformat` tinyint(1) NOT NULL,
  `frequency` smallint(4) NOT NULL,
  `timewindow` mediumint(5) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonirule_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonirule_eve_ix` (`eventname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store rules' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `ruleid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastnotificationsent` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonisubs_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonisubs_rul_ix` (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store user subscriptions to various rules' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_upgrade_log`
--

CREATE TABLE IF NOT EXISTS `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `targetversion` varchar(100) DEFAULT NULL,
  `info` varchar(255) NOT NULL DEFAULT '',
  `details` longtext,
  `backtrace` longtext,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Upgrade logging' AUTO_INCREMENT=1090 ;

--
-- Dumping data for table `mdl_upgrade_log`
--

INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2015051100.07', '2015051100.07', 'Upgrade savepoint reached', NULL, '', 0, 1435054199),
(2, 0, 'core', '2015051100.07', '2015051100.07', 'Core installed', NULL, '', 0, 1435054307),
(3, 0, 'availability_completion', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054308),
(4, 0, 'availability_completion', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054308),
(5, 0, 'availability_completion', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054309),
(6, 0, 'availability_date', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054309),
(7, 0, 'availability_date', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054309),
(8, 0, 'availability_date', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054309),
(9, 0, 'availability_grade', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054309),
(10, 0, 'availability_grade', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054309),
(11, 0, 'availability_grade', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054309),
(12, 0, 'availability_group', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054309),
(13, 0, 'availability_group', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054310),
(14, 0, 'availability_group', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054310),
(15, 0, 'availability_grouping', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054310),
(16, 0, 'availability_grouping', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054310),
(17, 0, 'availability_grouping', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054310),
(18, 0, 'availability_profile', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054310),
(19, 0, 'availability_profile', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054310),
(20, 0, 'availability_profile', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054311),
(21, 0, 'qtype_calculated', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054311),
(22, 0, 'qtype_calculated', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054313),
(23, 0, 'qtype_calculated', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054313),
(24, 0, 'qtype_calculatedmulti', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054313),
(25, 0, 'qtype_calculatedmulti', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054314),
(26, 0, 'qtype_calculatedmulti', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054314),
(27, 0, 'qtype_calculatedsimple', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054314),
(28, 0, 'qtype_calculatedsimple', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054314),
(29, 0, 'qtype_calculatedsimple', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054314),
(30, 0, 'qtype_description', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054314),
(31, 0, 'qtype_description', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054314),
(32, 0, 'qtype_description', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054315),
(33, 0, 'qtype_essay', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054315),
(34, 0, 'qtype_essay', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054315),
(35, 0, 'qtype_essay', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054316),
(36, 0, 'qtype_match', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054316),
(37, 0, 'qtype_match', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054317),
(38, 0, 'qtype_match', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054317),
(39, 0, 'qtype_missingtype', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054317),
(40, 0, 'qtype_missingtype', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054317),
(41, 0, 'qtype_missingtype', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054317),
(42, 0, 'qtype_multianswer', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054317),
(43, 0, 'qtype_multianswer', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054318),
(44, 0, 'qtype_multianswer', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054318),
(45, 0, 'qtype_multichoice', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054318),
(46, 0, 'qtype_multichoice', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054319),
(47, 0, 'qtype_multichoice', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054319),
(48, 0, 'qtype_numerical', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054319),
(49, 0, 'qtype_numerical', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054320),
(50, 0, 'qtype_numerical', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054320),
(51, 0, 'qtype_random', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054321),
(52, 0, 'qtype_random', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054321),
(53, 0, 'qtype_random', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054321),
(54, 0, 'qtype_randomsamatch', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054321),
(55, 0, 'qtype_randomsamatch', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054321),
(56, 0, 'qtype_randomsamatch', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054322),
(57, 0, 'qtype_shortanswer', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054322),
(58, 0, 'qtype_shortanswer', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054322),
(59, 0, 'qtype_shortanswer', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054322),
(60, 0, 'qtype_truefalse', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054323),
(61, 0, 'qtype_truefalse', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054323),
(62, 0, 'qtype_truefalse', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054323),
(63, 0, 'mod_assign', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054323),
(64, 0, 'mod_assign', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054327),
(65, 0, 'mod_assign', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054334),
(66, 0, 'mod_assignment', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054334),
(67, 0, 'mod_assignment', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054336),
(68, 0, 'mod_assignment', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054338),
(69, 0, 'mod_book', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054338),
(70, 0, 'mod_book', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054339),
(71, 0, 'mod_book', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054341),
(72, 0, 'mod_chat', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054341),
(73, 0, 'mod_chat', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054343),
(74, 0, 'mod_chat', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054346),
(75, 0, 'mod_choice', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054346),
(76, 0, 'mod_choice', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054347),
(77, 0, 'mod_choice', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054349),
(78, 0, 'mod_data', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054349),
(79, 0, 'mod_data', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054351),
(80, 0, 'mod_data', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054358),
(81, 0, 'mod_feedback', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054359),
(82, 0, 'mod_feedback', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054367),
(83, 0, 'mod_feedback', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054371),
(84, 0, 'mod_folder', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054371),
(85, 0, 'mod_folder', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054372),
(86, 0, 'mod_folder', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054373),
(87, 0, 'mod_forum', NULL, '2015051101', 'Starting plugin installation', NULL, '', 0, 1435054373),
(88, 0, 'mod_forum', '2015051101', '2015051101', 'Upgrade savepoint reached', NULL, '', 0, 1435054379),
(89, 0, 'mod_forum', '2015051101', '2015051101', 'Plugin installed', NULL, '', 0, 1435054394),
(90, 0, 'mod_glossary', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054395),
(91, 0, 'mod_glossary', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054398),
(92, 0, 'mod_glossary', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054404),
(93, 0, 'mod_imscp', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054404),
(94, 0, 'mod_imscp', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054404),
(95, 0, 'mod_imscp', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054405),
(96, 0, 'mod_label', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054405),
(97, 0, 'mod_label', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054406),
(98, 0, 'mod_label', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054407),
(99, 0, 'mod_lesson', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054407),
(100, 0, 'mod_lesson', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054411),
(101, 0, 'mod_lesson', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054413),
(102, 0, 'mod_lti', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054413),
(103, 0, 'mod_lti', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054418),
(104, 0, 'mod_lti', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054419),
(105, 0, 'mod_page', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054419),
(106, 0, 'mod_page', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054420),
(107, 0, 'mod_page', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054421),
(108, 0, 'mod_quiz', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054421),
(109, 0, 'mod_quiz', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054425),
(110, 0, 'mod_quiz', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054429),
(111, 0, 'mod_resource', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054430),
(112, 0, 'mod_resource', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054431),
(113, 0, 'mod_resource', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054431),
(114, 0, 'mod_scorm', NULL, '2015051101', 'Starting plugin installation', NULL, '', 0, 1435054432),
(115, 0, 'mod_scorm', '2015051101', '2015051101', 'Upgrade savepoint reached', NULL, '', 0, 1435054437),
(116, 0, 'mod_scorm', '2015051101', '2015051101', 'Plugin installed', NULL, '', 0, 1435054439),
(117, 0, 'mod_survey', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054440),
(118, 0, 'mod_survey', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054441),
(119, 0, 'mod_survey', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054448),
(120, 0, 'mod_url', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054449),
(121, 0, 'mod_url', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054449),
(122, 0, 'mod_url', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054450),
(123, 0, 'mod_wiki', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054450),
(124, 0, 'mod_wiki', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054453),
(125, 0, 'mod_wiki', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054456),
(126, 0, 'mod_workshop', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054456),
(127, 0, 'mod_workshop', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054466),
(128, 0, 'mod_workshop', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054472),
(129, 0, 'auth_cas', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054472),
(130, 0, 'auth_cas', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054472),
(131, 0, 'auth_cas', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054473),
(132, 0, 'auth_db', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054473),
(133, 0, 'auth_db', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054473),
(134, 0, 'auth_db', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054474),
(135, 0, 'auth_email', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054474),
(136, 0, 'auth_email', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054474),
(137, 0, 'auth_email', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054474),
(138, 0, 'auth_fc', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054474),
(139, 0, 'auth_fc', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054475),
(140, 0, 'auth_fc', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054475),
(141, 0, 'auth_imap', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054475),
(142, 0, 'auth_imap', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054475),
(143, 0, 'auth_imap', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054476),
(144, 0, 'auth_ldap', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054477),
(145, 0, 'auth_ldap', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054477),
(146, 0, 'auth_ldap', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054478),
(147, 0, 'auth_manual', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054478),
(148, 0, 'auth_manual', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054478),
(149, 0, 'auth_manual', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054478),
(150, 0, 'auth_mnet', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054478),
(151, 0, 'auth_mnet', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054478),
(152, 0, 'auth_mnet', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054482),
(153, 0, 'auth_nntp', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054482),
(154, 0, 'auth_nntp', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054482),
(155, 0, 'auth_nntp', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054484),
(156, 0, 'auth_nologin', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054484),
(157, 0, 'auth_nologin', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054484),
(158, 0, 'auth_nologin', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054484),
(159, 0, 'auth_none', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054485),
(160, 0, 'auth_none', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054485),
(161, 0, 'auth_none', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054485),
(162, 0, 'auth_pam', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054485),
(163, 0, 'auth_pam', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054485),
(164, 0, 'auth_pam', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054486),
(165, 0, 'auth_pop3', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054486),
(166, 0, 'auth_pop3', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054486),
(167, 0, 'auth_pop3', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054487),
(168, 0, 'auth_radius', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054487),
(169, 0, 'auth_radius', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054487),
(170, 0, 'auth_radius', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054487),
(171, 0, 'auth_shibboleth', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054487),
(172, 0, 'auth_shibboleth', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054487),
(173, 0, 'auth_shibboleth', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054488),
(174, 0, 'auth_webservice', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054488),
(175, 0, 'auth_webservice', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054488),
(176, 0, 'auth_webservice', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054488),
(177, 0, 'calendartype_gregorian', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054489),
(178, 0, 'calendartype_gregorian', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054489),
(179, 0, 'calendartype_gregorian', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054489),
(180, 0, 'enrol_category', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054489),
(181, 0, 'enrol_category', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054490),
(182, 0, 'enrol_category', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054490),
(183, 0, 'enrol_cohort', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054490),
(184, 0, 'enrol_cohort', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054490),
(185, 0, 'enrol_cohort', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054491),
(186, 0, 'enrol_database', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054491),
(187, 0, 'enrol_database', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054491),
(188, 0, 'enrol_database', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054492),
(189, 0, 'enrol_flatfile', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054492),
(190, 0, 'enrol_flatfile', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054493),
(191, 0, 'enrol_flatfile', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054494),
(192, 0, 'enrol_guest', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054494),
(193, 0, 'enrol_guest', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054494),
(194, 0, 'enrol_guest', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054494),
(195, 0, 'enrol_imsenterprise', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054494),
(196, 0, 'enrol_imsenterprise', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054494),
(197, 0, 'enrol_imsenterprise', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054495),
(198, 0, 'enrol_ldap', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054495),
(199, 0, 'enrol_ldap', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054496),
(200, 0, 'enrol_ldap', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054496),
(201, 0, 'enrol_manual', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054496),
(202, 0, 'enrol_manual', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054497),
(203, 0, 'enrol_manual', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054498),
(204, 0, 'enrol_meta', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054498),
(205, 0, 'enrol_meta', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054498),
(206, 0, 'enrol_meta', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054499),
(207, 0, 'enrol_mnet', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054499),
(208, 0, 'enrol_mnet', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054499),
(209, 0, 'enrol_mnet', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054504),
(210, 0, 'enrol_paypal', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054504),
(211, 0, 'enrol_paypal', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054509),
(212, 0, 'enrol_paypal', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054511),
(213, 0, 'enrol_self', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054511),
(214, 0, 'enrol_self', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054511),
(215, 0, 'enrol_self', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054513),
(216, 0, 'message_airnotifier', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054514),
(217, 0, 'message_airnotifier', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054514),
(218, 0, 'message_airnotifier', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054516),
(219, 0, 'message_email', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054516),
(220, 0, 'message_email', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054517),
(221, 0, 'message_email', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054519),
(222, 0, 'message_jabber', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054519),
(223, 0, 'message_jabber', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054519),
(224, 0, 'message_jabber', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054520),
(225, 0, 'message_popup', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054521),
(226, 0, 'message_popup', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054521),
(227, 0, 'message_popup', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054523),
(228, 0, 'block_activity_modules', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054523),
(229, 0, 'block_activity_modules', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054523),
(230, 0, 'block_activity_modules', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054524),
(231, 0, 'block_activity_results', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054524),
(232, 0, 'block_activity_results', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054524),
(233, 0, 'block_activity_results', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054525),
(234, 0, 'block_admin_bookmarks', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054525),
(235, 0, 'block_admin_bookmarks', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054525),
(236, 0, 'block_admin_bookmarks', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054526),
(237, 0, 'block_badges', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054526),
(238, 0, 'block_badges', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054526),
(239, 0, 'block_badges', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054527),
(240, 0, 'block_blog_menu', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054527),
(241, 0, 'block_blog_menu', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054527),
(242, 0, 'block_blog_menu', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054527),
(243, 0, 'block_blog_recent', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054527),
(244, 0, 'block_blog_recent', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054528),
(245, 0, 'block_blog_recent', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054528),
(246, 0, 'block_blog_tags', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054528),
(247, 0, 'block_blog_tags', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054529),
(248, 0, 'block_blog_tags', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054529),
(249, 0, 'block_calendar_month', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054529),
(250, 0, 'block_calendar_month', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054529),
(251, 0, 'block_calendar_month', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054530),
(252, 0, 'block_calendar_upcoming', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054530),
(253, 0, 'block_calendar_upcoming', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054530),
(254, 0, 'block_calendar_upcoming', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054531),
(255, 0, 'block_comments', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054531),
(256, 0, 'block_comments', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054531),
(257, 0, 'block_comments', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054532),
(258, 0, 'block_community', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054532),
(259, 0, 'block_community', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054532),
(260, 0, 'block_community', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054533),
(261, 0, 'block_completionstatus', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054533),
(262, 0, 'block_completionstatus', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054533),
(263, 0, 'block_completionstatus', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054533),
(264, 0, 'block_course_list', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054533),
(265, 0, 'block_course_list', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054534),
(266, 0, 'block_course_list', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054534),
(267, 0, 'block_course_overview', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054534),
(268, 0, 'block_course_overview', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054534),
(269, 0, 'block_course_overview', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054535),
(270, 0, 'block_course_summary', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054535),
(271, 0, 'block_course_summary', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054535),
(272, 0, 'block_course_summary', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054536),
(273, 0, 'block_feedback', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054536),
(274, 0, 'block_feedback', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054536),
(275, 0, 'block_feedback', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054537),
(276, 0, 'block_glossary_random', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054537),
(277, 0, 'block_glossary_random', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054537),
(278, 0, 'block_glossary_random', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054538),
(279, 0, 'block_html', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054538),
(280, 0, 'block_html', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054538),
(281, 0, 'block_html', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054539),
(282, 0, 'block_login', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054539),
(283, 0, 'block_login', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054539),
(284, 0, 'block_login', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054539),
(285, 0, 'block_mentees', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054540),
(286, 0, 'block_mentees', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054540),
(287, 0, 'block_mentees', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054540),
(288, 0, 'block_messages', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054540),
(289, 0, 'block_messages', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054541),
(290, 0, 'block_messages', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054541),
(291, 0, 'block_mnet_hosts', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054541),
(292, 0, 'block_mnet_hosts', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054542),
(293, 0, 'block_mnet_hosts', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054542),
(294, 0, 'block_myprofile', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054542),
(295, 0, 'block_myprofile', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054542),
(296, 0, 'block_myprofile', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054543),
(297, 0, 'block_navigation', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054543),
(298, 0, 'block_navigation', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054543),
(299, 0, 'block_navigation', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054544),
(300, 0, 'block_news_items', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054544),
(301, 0, 'block_news_items', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054544),
(302, 0, 'block_news_items', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054545),
(303, 0, 'block_online_users', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054545),
(304, 0, 'block_online_users', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054545),
(305, 0, 'block_online_users', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054546),
(306, 0, 'block_participants', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054546),
(307, 0, 'block_participants', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054546),
(308, 0, 'block_participants', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054547),
(309, 0, 'block_private_files', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054547),
(310, 0, 'block_private_files', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054548),
(311, 0, 'block_private_files', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054549),
(312, 0, 'block_quiz_results', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054549),
(313, 0, 'block_quiz_results', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054550),
(314, 0, 'block_quiz_results', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054550),
(315, 0, 'block_recent_activity', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054550),
(316, 0, 'block_recent_activity', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054551),
(317, 0, 'block_recent_activity', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054552),
(318, 0, 'block_rss_client', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054552),
(319, 0, 'block_rss_client', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054552),
(320, 0, 'block_rss_client', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054553),
(321, 0, 'block_search_forums', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054553),
(322, 0, 'block_search_forums', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054553),
(323, 0, 'block_search_forums', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054554),
(324, 0, 'block_section_links', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054554),
(325, 0, 'block_section_links', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054554),
(326, 0, 'block_section_links', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054555),
(327, 0, 'block_selfcompletion', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054555),
(328, 0, 'block_selfcompletion', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054555),
(329, 0, 'block_selfcompletion', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054556),
(330, 0, 'block_settings', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054556),
(331, 0, 'block_settings', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054556),
(332, 0, 'block_settings', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054557),
(333, 0, 'block_site_main_menu', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054557),
(334, 0, 'block_site_main_menu', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054557),
(335, 0, 'block_site_main_menu', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054557),
(336, 0, 'block_social_activities', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054557),
(337, 0, 'block_social_activities', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054558),
(338, 0, 'block_social_activities', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054558),
(339, 0, 'block_tag_flickr', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054558),
(340, 0, 'block_tag_flickr', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054559),
(341, 0, 'block_tag_flickr', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054562),
(342, 0, 'block_tag_youtube', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054562),
(343, 0, 'block_tag_youtube', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054562),
(344, 0, 'block_tag_youtube', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054563),
(345, 0, 'block_tags', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054563),
(346, 0, 'block_tags', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054563),
(347, 0, 'block_tags', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054563),
(348, 0, 'filter_activitynames', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054566),
(349, 0, 'filter_activitynames', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054566),
(350, 0, 'filter_activitynames', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054567),
(351, 0, 'filter_algebra', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054567),
(352, 0, 'filter_algebra', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054567),
(353, 0, 'filter_algebra', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054567),
(354, 0, 'filter_censor', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054567),
(355, 0, 'filter_censor', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054567),
(356, 0, 'filter_censor', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054567),
(357, 0, 'filter_data', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054568),
(358, 0, 'filter_data', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054568),
(359, 0, 'filter_data', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054568),
(360, 0, 'filter_emailprotect', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054568),
(361, 0, 'filter_emailprotect', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054568),
(362, 0, 'filter_emailprotect', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054569),
(363, 0, 'filter_emoticon', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054569),
(364, 0, 'filter_emoticon', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054569),
(365, 0, 'filter_emoticon', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054569),
(366, 0, 'filter_glossary', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054569),
(367, 0, 'filter_glossary', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054570),
(368, 0, 'filter_glossary', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054570),
(369, 0, 'filter_mathjaxloader', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054570),
(370, 0, 'filter_mathjaxloader', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054570),
(371, 0, 'filter_mathjaxloader', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054571),
(372, 0, 'filter_mediaplugin', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054571),
(373, 0, 'filter_mediaplugin', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054571),
(374, 0, 'filter_mediaplugin', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054571),
(375, 0, 'filter_multilang', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054572),
(376, 0, 'filter_multilang', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054572),
(377, 0, 'filter_multilang', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054572),
(378, 0, 'filter_tex', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054572),
(379, 0, 'filter_tex', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054572),
(380, 0, 'filter_tex', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054573),
(381, 0, 'filter_tidy', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054573),
(382, 0, 'filter_tidy', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054573),
(383, 0, 'filter_tidy', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054573),
(384, 0, 'filter_urltolink', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054573),
(385, 0, 'filter_urltolink', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054573),
(386, 0, 'filter_urltolink', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054574),
(387, 0, 'editor_atto', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054574),
(388, 0, 'editor_atto', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054574),
(389, 0, 'editor_atto', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054575),
(390, 0, 'editor_textarea', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054575),
(391, 0, 'editor_textarea', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054575),
(392, 0, 'editor_textarea', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054575),
(393, 0, 'editor_tinymce', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054575),
(394, 0, 'editor_tinymce', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054576),
(395, 0, 'editor_tinymce', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054576),
(396, 0, 'format_singleactivity', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054576),
(397, 0, 'format_singleactivity', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054576),
(398, 0, 'format_singleactivity', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054576),
(399, 0, 'format_social', NULL, '2015102100', 'Starting plugin installation', NULL, '', 0, 1435054576),
(400, 0, 'format_social', '2015102100', '2015102100', 'Upgrade savepoint reached', NULL, '', 0, 1435054577),
(401, 0, 'format_social', '2015102100', '2015102100', 'Plugin installed', NULL, '', 0, 1435054577),
(402, 0, 'format_topics', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054577),
(403, 0, 'format_topics', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054577),
(404, 0, 'format_topics', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054577),
(405, 0, 'format_weeks', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054577),
(406, 0, 'format_weeks', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054578),
(407, 0, 'format_weeks', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054578),
(408, 0, 'profilefield_checkbox', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054578),
(409, 0, 'profilefield_checkbox', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054578),
(410, 0, 'profilefield_checkbox', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054578),
(411, 0, 'profilefield_datetime', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054578),
(412, 0, 'profilefield_datetime', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054579),
(413, 0, 'profilefield_datetime', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054579),
(414, 0, 'profilefield_menu', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054579),
(415, 0, 'profilefield_menu', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054579),
(416, 0, 'profilefield_menu', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054579),
(417, 0, 'profilefield_text', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054579),
(418, 0, 'profilefield_text', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054580),
(419, 0, 'profilefield_text', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054580),
(420, 0, 'profilefield_textarea', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054580),
(421, 0, 'profilefield_textarea', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054580),
(422, 0, 'profilefield_textarea', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054581),
(423, 0, 'report_backups', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054581),
(424, 0, 'report_backups', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054581),
(425, 0, 'report_backups', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054581),
(426, 0, 'report_completion', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054581),
(427, 0, 'report_completion', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054582),
(428, 0, 'report_completion', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054582),
(429, 0, 'report_configlog', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054582),
(430, 0, 'report_configlog', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054582),
(431, 0, 'report_configlog', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054583),
(432, 0, 'report_courseoverview', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054583),
(433, 0, 'report_courseoverview', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054583),
(434, 0, 'report_courseoverview', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054583),
(435, 0, 'report_eventlist', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054584),
(436, 0, 'report_eventlist', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054584),
(437, 0, 'report_eventlist', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054584),
(438, 0, 'report_log', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054584),
(439, 0, 'report_log', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054584),
(440, 0, 'report_log', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054585),
(441, 0, 'report_loglive', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054585),
(442, 0, 'report_loglive', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054585),
(443, 0, 'report_loglive', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054586),
(444, 0, 'report_outline', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054586),
(445, 0, 'report_outline', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054586),
(446, 0, 'report_outline', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054587),
(447, 0, 'report_participation', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054587),
(448, 0, 'report_participation', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054587),
(449, 0, 'report_participation', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054588),
(450, 0, 'report_performance', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054588),
(451, 0, 'report_performance', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054588),
(452, 0, 'report_performance', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054588),
(453, 0, 'report_progress', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054588),
(454, 0, 'report_progress', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054588),
(455, 0, 'report_progress', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054589),
(456, 0, 'report_questioninstances', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054589),
(457, 0, 'report_questioninstances', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054589),
(458, 0, 'report_questioninstances', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054589),
(459, 0, 'report_security', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054590),
(460, 0, 'report_security', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054590),
(461, 0, 'report_security', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054590),
(462, 0, 'report_stats', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054590),
(463, 0, 'report_stats', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054590),
(464, 0, 'report_stats', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054591),
(465, 0, 'report_usersessions', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054591),
(466, 0, 'report_usersessions', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054592),
(467, 0, 'report_usersessions', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054592),
(468, 0, 'gradeexport_ods', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054592),
(469, 0, 'gradeexport_ods', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054592),
(470, 0, 'gradeexport_ods', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054593),
(471, 0, 'gradeexport_txt', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054593),
(472, 0, 'gradeexport_txt', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054593),
(473, 0, 'gradeexport_txt', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054594),
(474, 0, 'gradeexport_xls', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054594),
(475, 0, 'gradeexport_xls', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054594),
(476, 0, 'gradeexport_xls', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054594),
(477, 0, 'gradeexport_xml', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054595),
(478, 0, 'gradeexport_xml', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054595),
(479, 0, 'gradeexport_xml', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054595),
(480, 0, 'gradeimport_csv', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054595);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(481, 0, 'gradeimport_csv', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054595),
(482, 0, 'gradeimport_csv', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054596),
(483, 0, 'gradeimport_direct', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054596),
(484, 0, 'gradeimport_direct', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054596),
(485, 0, 'gradeimport_direct', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054597),
(486, 0, 'gradeimport_xml', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054597),
(487, 0, 'gradeimport_xml', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054597),
(488, 0, 'gradeimport_xml', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054597),
(489, 0, 'gradereport_grader', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054597),
(490, 0, 'gradereport_grader', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054598),
(491, 0, 'gradereport_grader', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054598),
(492, 0, 'gradereport_history', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054598),
(493, 0, 'gradereport_history', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054598),
(494, 0, 'gradereport_history', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054599),
(495, 0, 'gradereport_outcomes', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054599),
(496, 0, 'gradereport_outcomes', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054599),
(497, 0, 'gradereport_outcomes', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054599),
(498, 0, 'gradereport_overview', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054599),
(499, 0, 'gradereport_overview', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054600),
(500, 0, 'gradereport_overview', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054600),
(501, 0, 'gradereport_singleview', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054600),
(502, 0, 'gradereport_singleview', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054600),
(503, 0, 'gradereport_singleview', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054601),
(504, 0, 'gradereport_user', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054601),
(505, 0, 'gradereport_user', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054601),
(506, 0, 'gradereport_user', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054601),
(507, 0, 'gradingform_guide', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054602),
(508, 0, 'gradingform_guide', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054603),
(509, 0, 'gradingform_guide', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054603),
(510, 0, 'gradingform_rubric', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054604),
(511, 0, 'gradingform_rubric', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054609),
(512, 0, 'gradingform_rubric', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054609),
(513, 0, 'mnetservice_enrol', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054609),
(514, 0, 'mnetservice_enrol', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054610),
(515, 0, 'mnetservice_enrol', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054611),
(516, 0, 'webservice_amf', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054611),
(517, 0, 'webservice_amf', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054611),
(518, 0, 'webservice_amf', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054611),
(519, 0, 'webservice_rest', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054611),
(520, 0, 'webservice_rest', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054612),
(521, 0, 'webservice_rest', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054612),
(522, 0, 'webservice_soap', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054612),
(523, 0, 'webservice_soap', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054612),
(524, 0, 'webservice_soap', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054612),
(525, 0, 'webservice_xmlrpc', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054613),
(526, 0, 'webservice_xmlrpc', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054613),
(527, 0, 'webservice_xmlrpc', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054613),
(528, 0, 'repository_alfresco', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054613),
(529, 0, 'repository_alfresco', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054613),
(530, 0, 'repository_alfresco', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054614),
(531, 0, 'repository_areafiles', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054614),
(532, 0, 'repository_areafiles', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054614),
(533, 0, 'repository_areafiles', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054615),
(534, 0, 'repository_boxnet', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054615),
(535, 0, 'repository_boxnet', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054615),
(536, 0, 'repository_boxnet', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054616),
(537, 0, 'repository_coursefiles', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054616),
(538, 0, 'repository_coursefiles', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054616),
(539, 0, 'repository_coursefiles', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054617),
(540, 0, 'repository_dropbox', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054617),
(541, 0, 'repository_dropbox', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054617),
(542, 0, 'repository_dropbox', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054617),
(543, 0, 'repository_equella', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054617),
(544, 0, 'repository_equella', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054617),
(545, 0, 'repository_equella', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054618),
(546, 0, 'repository_filesystem', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054618),
(547, 0, 'repository_filesystem', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054618),
(548, 0, 'repository_filesystem', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054619),
(549, 0, 'repository_flickr', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054619),
(550, 0, 'repository_flickr', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054619),
(551, 0, 'repository_flickr', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054619),
(552, 0, 'repository_flickr_public', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054619),
(553, 0, 'repository_flickr_public', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054619),
(554, 0, 'repository_flickr_public', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054620),
(555, 0, 'repository_googledocs', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054620),
(556, 0, 'repository_googledocs', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054620),
(557, 0, 'repository_googledocs', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054620),
(558, 0, 'repository_local', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054621),
(559, 0, 'repository_local', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054621),
(560, 0, 'repository_local', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054622),
(561, 0, 'repository_merlot', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054622),
(562, 0, 'repository_merlot', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054622),
(563, 0, 'repository_merlot', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054622),
(564, 0, 'repository_picasa', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054623),
(565, 0, 'repository_picasa', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054623),
(566, 0, 'repository_picasa', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054623),
(567, 0, 'repository_recent', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054623),
(568, 0, 'repository_recent', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054623),
(569, 0, 'repository_recent', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054624),
(570, 0, 'repository_s3', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054624),
(571, 0, 'repository_s3', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054624),
(572, 0, 'repository_s3', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054625),
(573, 0, 'repository_skydrive', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054625),
(574, 0, 'repository_skydrive', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054625),
(575, 0, 'repository_skydrive', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054625),
(576, 0, 'repository_upload', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054625),
(577, 0, 'repository_upload', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054626),
(578, 0, 'repository_upload', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054626),
(579, 0, 'repository_url', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054627),
(580, 0, 'repository_url', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054627),
(581, 0, 'repository_url', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054627),
(582, 0, 'repository_user', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054628),
(583, 0, 'repository_user', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054628),
(584, 0, 'repository_user', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054628),
(585, 0, 'repository_webdav', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054629),
(586, 0, 'repository_webdav', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054629),
(587, 0, 'repository_webdav', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054629),
(588, 0, 'repository_wikimedia', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054629),
(589, 0, 'repository_wikimedia', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054630),
(590, 0, 'repository_wikimedia', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054630),
(591, 0, 'repository_youtube', NULL, '2015051101', 'Starting plugin installation', NULL, '', 0, 1435054630),
(592, 0, 'repository_youtube', '2015051101', '2015051101', 'Upgrade savepoint reached', NULL, '', 0, 1435054631),
(593, 0, 'repository_youtube', '2015051101', '2015051101', 'Plugin installed', NULL, '', 0, 1435054631),
(594, 0, 'portfolio_boxnet', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054631),
(595, 0, 'portfolio_boxnet', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054632),
(596, 0, 'portfolio_boxnet', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054632),
(597, 0, 'portfolio_download', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054632),
(598, 0, 'portfolio_download', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054632),
(599, 0, 'portfolio_download', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054632),
(600, 0, 'portfolio_flickr', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054632),
(601, 0, 'portfolio_flickr', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054633),
(602, 0, 'portfolio_flickr', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054633),
(603, 0, 'portfolio_googledocs', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054633),
(604, 0, 'portfolio_googledocs', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054633),
(605, 0, 'portfolio_googledocs', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054633),
(606, 0, 'portfolio_mahara', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054633),
(607, 0, 'portfolio_mahara', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054634),
(608, 0, 'portfolio_mahara', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054635),
(609, 0, 'portfolio_picasa', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054635),
(610, 0, 'portfolio_picasa', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054635),
(611, 0, 'portfolio_picasa', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054636),
(612, 0, 'qbehaviour_adaptive', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054636),
(613, 0, 'qbehaviour_adaptive', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054636),
(614, 0, 'qbehaviour_adaptive', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054636),
(615, 0, 'qbehaviour_adaptivenopenalty', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054636),
(616, 0, 'qbehaviour_adaptivenopenalty', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054637),
(617, 0, 'qbehaviour_adaptivenopenalty', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054637),
(618, 0, 'qbehaviour_deferredcbm', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054637),
(619, 0, 'qbehaviour_deferredcbm', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054637),
(620, 0, 'qbehaviour_deferredcbm', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054637),
(621, 0, 'qbehaviour_deferredfeedback', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054637),
(622, 0, 'qbehaviour_deferredfeedback', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054637),
(623, 0, 'qbehaviour_deferredfeedback', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054638),
(624, 0, 'qbehaviour_immediatecbm', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054638),
(625, 0, 'qbehaviour_immediatecbm', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054638),
(626, 0, 'qbehaviour_immediatecbm', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054638),
(627, 0, 'qbehaviour_immediatefeedback', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054638),
(628, 0, 'qbehaviour_immediatefeedback', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054638),
(629, 0, 'qbehaviour_immediatefeedback', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054638),
(630, 0, 'qbehaviour_informationitem', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054638),
(631, 0, 'qbehaviour_informationitem', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054639),
(632, 0, 'qbehaviour_informationitem', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054639),
(633, 0, 'qbehaviour_interactive', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054639),
(634, 0, 'qbehaviour_interactive', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054639),
(635, 0, 'qbehaviour_interactive', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054639),
(636, 0, 'qbehaviour_interactivecountback', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054639),
(637, 0, 'qbehaviour_interactivecountback', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054640),
(638, 0, 'qbehaviour_interactivecountback', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054640),
(639, 0, 'qbehaviour_manualgraded', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054640),
(640, 0, 'qbehaviour_manualgraded', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054640),
(641, 0, 'qbehaviour_manualgraded', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054640),
(642, 0, 'qbehaviour_missing', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054641),
(643, 0, 'qbehaviour_missing', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054641),
(644, 0, 'qbehaviour_missing', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054641),
(645, 0, 'qformat_aiken', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054641),
(646, 0, 'qformat_aiken', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054641),
(647, 0, 'qformat_aiken', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054641),
(648, 0, 'qformat_blackboard_six', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054641),
(649, 0, 'qformat_blackboard_six', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054642),
(650, 0, 'qformat_blackboard_six', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054642),
(651, 0, 'qformat_examview', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054642),
(652, 0, 'qformat_examview', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054642),
(653, 0, 'qformat_examview', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054642),
(654, 0, 'qformat_gift', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054642),
(655, 0, 'qformat_gift', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054642),
(656, 0, 'qformat_gift', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054643),
(657, 0, 'qformat_missingword', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054643),
(658, 0, 'qformat_missingword', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054643),
(659, 0, 'qformat_missingword', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054643),
(660, 0, 'qformat_multianswer', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054643),
(661, 0, 'qformat_multianswer', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054643),
(662, 0, 'qformat_multianswer', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054644),
(663, 0, 'qformat_webct', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054644),
(664, 0, 'qformat_webct', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054644),
(665, 0, 'qformat_webct', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054644),
(666, 0, 'qformat_xhtml', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054644),
(667, 0, 'qformat_xhtml', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054644),
(668, 0, 'qformat_xhtml', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054645),
(669, 0, 'qformat_xml', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054645),
(670, 0, 'qformat_xml', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054645),
(671, 0, 'qformat_xml', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054645),
(672, 0, 'tool_assignmentupgrade', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054645),
(673, 0, 'tool_assignmentupgrade', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054645),
(674, 0, 'tool_assignmentupgrade', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054646),
(675, 0, 'tool_availabilityconditions', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054646),
(676, 0, 'tool_availabilityconditions', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054646),
(677, 0, 'tool_availabilityconditions', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054646),
(678, 0, 'tool_behat', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054646),
(679, 0, 'tool_behat', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054646),
(680, 0, 'tool_behat', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054647),
(681, 0, 'tool_capability', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054647),
(682, 0, 'tool_capability', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054647),
(683, 0, 'tool_capability', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054647),
(684, 0, 'tool_customlang', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054647),
(685, 0, 'tool_customlang', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054648),
(686, 0, 'tool_customlang', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054649),
(687, 0, 'tool_dbtransfer', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054649),
(688, 0, 'tool_dbtransfer', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054649),
(689, 0, 'tool_dbtransfer', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054649),
(690, 0, 'tool_filetypes', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054649),
(691, 0, 'tool_filetypes', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054650),
(692, 0, 'tool_filetypes', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054650),
(693, 0, 'tool_generator', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054650),
(694, 0, 'tool_generator', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054650),
(695, 0, 'tool_generator', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054651),
(696, 0, 'tool_health', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054651),
(697, 0, 'tool_health', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054652),
(698, 0, 'tool_health', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054652),
(699, 0, 'tool_innodb', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054652),
(700, 0, 'tool_innodb', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054653),
(701, 0, 'tool_innodb', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054653),
(702, 0, 'tool_installaddon', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054653),
(703, 0, 'tool_installaddon', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054653),
(704, 0, 'tool_installaddon', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054653),
(705, 0, 'tool_langimport', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054654),
(706, 0, 'tool_langimport', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054654),
(707, 0, 'tool_langimport', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054654),
(708, 0, 'tool_log', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054654),
(709, 0, 'tool_log', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054654),
(710, 0, 'tool_log', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054655),
(711, 0, 'tool_messageinbound', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054655),
(712, 0, 'tool_messageinbound', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054655),
(713, 0, 'tool_messageinbound', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054656),
(714, 0, 'tool_monitor', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054656),
(715, 0, 'tool_monitor', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054658),
(716, 0, 'tool_monitor', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054659),
(717, 0, 'tool_multilangupgrade', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054659),
(718, 0, 'tool_multilangupgrade', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054659),
(719, 0, 'tool_multilangupgrade', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054660),
(720, 0, 'tool_phpunit', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054660),
(721, 0, 'tool_phpunit', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054660),
(722, 0, 'tool_phpunit', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054660),
(723, 0, 'tool_profiling', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054660),
(724, 0, 'tool_profiling', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054660),
(725, 0, 'tool_profiling', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054660),
(726, 0, 'tool_replace', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054661),
(727, 0, 'tool_replace', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054661),
(728, 0, 'tool_replace', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054661),
(729, 0, 'tool_spamcleaner', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054661),
(730, 0, 'tool_spamcleaner', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054661),
(731, 0, 'tool_spamcleaner', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054661),
(732, 0, 'tool_task', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054661),
(733, 0, 'tool_task', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054661),
(734, 0, 'tool_task', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054662),
(735, 0, 'tool_templatelibrary', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054662),
(736, 0, 'tool_templatelibrary', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054662),
(737, 0, 'tool_templatelibrary', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054662),
(738, 0, 'tool_unsuproles', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054662),
(739, 0, 'tool_unsuproles', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054663),
(740, 0, 'tool_unsuproles', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054665),
(741, 0, 'tool_uploadcourse', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054666),
(742, 0, 'tool_uploadcourse', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054666),
(743, 0, 'tool_uploadcourse', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054666),
(744, 0, 'tool_uploaduser', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054666),
(745, 0, 'tool_uploaduser', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054666),
(746, 0, 'tool_uploaduser', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054667),
(747, 0, 'tool_xmldb', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054667),
(748, 0, 'tool_xmldb', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054667),
(749, 0, 'tool_xmldb', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054668),
(750, 0, 'cachestore_file', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054668),
(751, 0, 'cachestore_file', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054668),
(752, 0, 'cachestore_file', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054668),
(753, 0, 'cachestore_memcache', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054668),
(754, 0, 'cachestore_memcache', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054668),
(755, 0, 'cachestore_memcache', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054668),
(756, 0, 'cachestore_memcached', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054669),
(757, 0, 'cachestore_memcached', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054669),
(758, 0, 'cachestore_memcached', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054669),
(759, 0, 'cachestore_mongodb', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054669),
(760, 0, 'cachestore_mongodb', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054669),
(761, 0, 'cachestore_mongodb', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054670),
(762, 0, 'cachestore_session', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054670),
(763, 0, 'cachestore_session', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054670),
(764, 0, 'cachestore_session', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054670),
(765, 0, 'cachestore_static', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054670),
(766, 0, 'cachestore_static', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054670),
(767, 0, 'cachestore_static', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054670),
(768, 0, 'cachelock_file', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054670),
(769, 0, 'cachelock_file', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054671),
(770, 0, 'cachelock_file', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054671),
(771, 0, 'theme_base', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054671),
(772, 0, 'theme_base', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054671),
(773, 0, 'theme_base', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054671),
(774, 0, 'theme_bootstrapbase', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054671),
(775, 0, 'theme_bootstrapbase', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054672),
(776, 0, 'theme_bootstrapbase', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054672),
(777, 0, 'theme_canvas', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054672),
(778, 0, 'theme_canvas', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054672),
(779, 0, 'theme_canvas', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054672),
(780, 0, 'theme_clean', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054673),
(781, 0, 'theme_clean', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054673),
(782, 0, 'theme_clean', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054673),
(783, 0, 'theme_more', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054673),
(784, 0, 'theme_more', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054673),
(785, 0, 'theme_more', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054674),
(786, 0, 'assignsubmission_comments', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054674),
(787, 0, 'assignsubmission_comments', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054674),
(788, 0, 'assignsubmission_comments', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054675),
(789, 0, 'assignsubmission_file', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054675),
(790, 0, 'assignsubmission_file', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054676),
(791, 0, 'assignsubmission_file', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054676),
(792, 0, 'assignsubmission_onlinetext', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054676),
(793, 0, 'assignsubmission_onlinetext', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054677),
(794, 0, 'assignsubmission_onlinetext', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054677),
(795, 0, 'assignfeedback_comments', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054678),
(796, 0, 'assignfeedback_comments', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054678),
(797, 0, 'assignfeedback_comments', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054679),
(798, 0, 'assignfeedback_editpdf', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054679),
(799, 0, 'assignfeedback_editpdf', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054681),
(800, 0, 'assignfeedback_editpdf', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054683),
(801, 0, 'assignfeedback_file', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054683),
(802, 0, 'assignfeedback_file', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054684),
(803, 0, 'assignfeedback_file', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054685),
(804, 0, 'assignfeedback_offline', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054685),
(805, 0, 'assignfeedback_offline', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054685),
(806, 0, 'assignfeedback_offline', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054685),
(807, 0, 'assignment_offline', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054685),
(808, 0, 'assignment_offline', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054686),
(809, 0, 'assignment_offline', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054686),
(810, 0, 'assignment_online', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054686),
(811, 0, 'assignment_online', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054686),
(812, 0, 'assignment_online', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054687),
(813, 0, 'assignment_upload', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054687),
(814, 0, 'assignment_upload', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054687),
(815, 0, 'assignment_upload', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054687),
(816, 0, 'assignment_uploadsingle', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054687),
(817, 0, 'assignment_uploadsingle', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054687),
(818, 0, 'assignment_uploadsingle', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054688),
(819, 0, 'booktool_exportimscp', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054688),
(820, 0, 'booktool_exportimscp', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054688),
(821, 0, 'booktool_exportimscp', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054688),
(822, 0, 'booktool_importhtml', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054688),
(823, 0, 'booktool_importhtml', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054688),
(824, 0, 'booktool_importhtml', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054689),
(825, 0, 'booktool_print', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054689),
(826, 0, 'booktool_print', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054689),
(827, 0, 'booktool_print', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054690),
(828, 0, 'datafield_checkbox', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054690),
(829, 0, 'datafield_checkbox', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054690),
(830, 0, 'datafield_checkbox', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054691),
(831, 0, 'datafield_date', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054691),
(832, 0, 'datafield_date', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054691),
(833, 0, 'datafield_date', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054691),
(834, 0, 'datafield_file', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054691),
(835, 0, 'datafield_file', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054691),
(836, 0, 'datafield_file', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054692),
(837, 0, 'datafield_latlong', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054692),
(838, 0, 'datafield_latlong', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054692),
(839, 0, 'datafield_latlong', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054692),
(840, 0, 'datafield_menu', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054692),
(841, 0, 'datafield_menu', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054692),
(842, 0, 'datafield_menu', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054693),
(843, 0, 'datafield_multimenu', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054693),
(844, 0, 'datafield_multimenu', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054693),
(845, 0, 'datafield_multimenu', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054693),
(846, 0, 'datafield_number', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054693),
(847, 0, 'datafield_number', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054693),
(848, 0, 'datafield_number', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054694),
(849, 0, 'datafield_picture', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054694),
(850, 0, 'datafield_picture', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054694),
(851, 0, 'datafield_picture', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054694),
(852, 0, 'datafield_radiobutton', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054694),
(853, 0, 'datafield_radiobutton', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054694),
(854, 0, 'datafield_radiobutton', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054695),
(855, 0, 'datafield_text', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054695),
(856, 0, 'datafield_text', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054695),
(857, 0, 'datafield_text', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054695),
(858, 0, 'datafield_textarea', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054695),
(859, 0, 'datafield_textarea', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054695),
(860, 0, 'datafield_textarea', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054695),
(861, 0, 'datafield_url', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054696),
(862, 0, 'datafield_url', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054696),
(863, 0, 'datafield_url', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054696),
(864, 0, 'datapreset_imagegallery', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054696),
(865, 0, 'datapreset_imagegallery', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054696),
(866, 0, 'datapreset_imagegallery', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054696),
(867, 0, 'ltiservice_profile', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054697),
(868, 0, 'ltiservice_profile', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054697),
(869, 0, 'ltiservice_profile', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054697),
(870, 0, 'ltiservice_toolproxy', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054697),
(871, 0, 'ltiservice_toolproxy', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054697),
(872, 0, 'ltiservice_toolproxy', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054697),
(873, 0, 'ltiservice_toolsettings', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054698),
(874, 0, 'ltiservice_toolsettings', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054698),
(875, 0, 'ltiservice_toolsettings', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054698),
(876, 0, 'quiz_grading', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054698),
(877, 0, 'quiz_grading', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054698),
(878, 0, 'quiz_grading', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054699),
(879, 0, 'quiz_overview', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054699),
(880, 0, 'quiz_overview', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054700),
(881, 0, 'quiz_overview', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054701),
(882, 0, 'quiz_responses', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054701),
(883, 0, 'quiz_responses', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054701),
(884, 0, 'quiz_responses', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054701),
(885, 0, 'quiz_statistics', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054701),
(886, 0, 'quiz_statistics', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054702),
(887, 0, 'quiz_statistics', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054703),
(888, 0, 'quizaccess_delaybetweenattempts', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054703),
(889, 0, 'quizaccess_delaybetweenattempts', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054703),
(890, 0, 'quizaccess_delaybetweenattempts', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054703),
(891, 0, 'quizaccess_ipaddress', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054703),
(892, 0, 'quizaccess_ipaddress', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054703),
(893, 0, 'quizaccess_ipaddress', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054704),
(894, 0, 'quizaccess_numattempts', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054704),
(895, 0, 'quizaccess_numattempts', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054704),
(896, 0, 'quizaccess_numattempts', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054704),
(897, 0, 'quizaccess_openclosedate', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054704),
(898, 0, 'quizaccess_openclosedate', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054704),
(899, 0, 'quizaccess_openclosedate', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054705),
(900, 0, 'quizaccess_password', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054705),
(901, 0, 'quizaccess_password', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054705),
(902, 0, 'quizaccess_password', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054705),
(903, 0, 'quizaccess_safebrowser', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054705),
(904, 0, 'quizaccess_safebrowser', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054705),
(905, 0, 'quizaccess_safebrowser', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054706),
(906, 0, 'quizaccess_securewindow', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054706),
(907, 0, 'quizaccess_securewindow', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054706),
(908, 0, 'quizaccess_securewindow', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054706),
(909, 0, 'quizaccess_timelimit', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054706),
(910, 0, 'quizaccess_timelimit', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054706),
(911, 0, 'quizaccess_timelimit', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054707),
(912, 0, 'scormreport_basic', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054707),
(913, 0, 'scormreport_basic', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054707),
(914, 0, 'scormreport_basic', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054707),
(915, 0, 'scormreport_graphs', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054707),
(916, 0, 'scormreport_graphs', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054708),
(917, 0, 'scormreport_graphs', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054709),
(918, 0, 'scormreport_interactions', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054710),
(919, 0, 'scormreport_interactions', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054711),
(920, 0, 'scormreport_interactions', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054711),
(921, 0, 'scormreport_objectives', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054711),
(922, 0, 'scormreport_objectives', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054711),
(923, 0, 'scormreport_objectives', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054712),
(924, 0, 'workshopform_accumulative', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054712),
(925, 0, 'workshopform_accumulative', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054713),
(926, 0, 'workshopform_accumulative', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054713),
(927, 0, 'workshopform_comments', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054714),
(928, 0, 'workshopform_comments', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054714),
(929, 0, 'workshopform_comments', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054714),
(930, 0, 'workshopform_numerrors', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054714),
(931, 0, 'workshopform_numerrors', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054715),
(932, 0, 'workshopform_numerrors', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054716),
(933, 0, 'workshopform_rubric', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054716),
(934, 0, 'workshopform_rubric', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054717),
(935, 0, 'workshopform_rubric', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054717),
(936, 0, 'workshopallocation_manual', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054717),
(937, 0, 'workshopallocation_manual', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054718),
(938, 0, 'workshopallocation_manual', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054718),
(939, 0, 'workshopallocation_random', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054718),
(940, 0, 'workshopallocation_random', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054718),
(941, 0, 'workshopallocation_random', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054718),
(942, 0, 'workshopallocation_scheduled', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054718),
(943, 0, 'workshopallocation_scheduled', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054719),
(944, 0, 'workshopallocation_scheduled', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054719);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(945, 0, 'workshopeval_best', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054719),
(946, 0, 'workshopeval_best', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054720),
(947, 0, 'workshopeval_best', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054720),
(948, 0, 'atto_accessibilitychecker', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054720),
(949, 0, 'atto_accessibilitychecker', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054720),
(950, 0, 'atto_accessibilitychecker', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054720),
(951, 0, 'atto_accessibilityhelper', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054720),
(952, 0, 'atto_accessibilityhelper', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054720),
(953, 0, 'atto_accessibilityhelper', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054721),
(954, 0, 'atto_align', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054721),
(955, 0, 'atto_align', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054721),
(956, 0, 'atto_align', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054721),
(957, 0, 'atto_backcolor', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054721),
(958, 0, 'atto_backcolor', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054721),
(959, 0, 'atto_backcolor', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054722),
(960, 0, 'atto_bold', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054722),
(961, 0, 'atto_bold', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054722),
(962, 0, 'atto_bold', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054722),
(963, 0, 'atto_charmap', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054722),
(964, 0, 'atto_charmap', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054722),
(965, 0, 'atto_charmap', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054723),
(966, 0, 'atto_clear', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054723),
(967, 0, 'atto_clear', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054723),
(968, 0, 'atto_clear', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054723),
(969, 0, 'atto_collapse', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054723),
(970, 0, 'atto_collapse', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054723),
(971, 0, 'atto_collapse', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054723),
(972, 0, 'atto_emoticon', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054723),
(973, 0, 'atto_emoticon', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054724),
(974, 0, 'atto_emoticon', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054724),
(975, 0, 'atto_equation', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054724),
(976, 0, 'atto_equation', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054724),
(977, 0, 'atto_equation', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054724),
(978, 0, 'atto_fontcolor', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054724),
(979, 0, 'atto_fontcolor', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054724),
(980, 0, 'atto_fontcolor', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054725),
(981, 0, 'atto_html', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054725),
(982, 0, 'atto_html', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054725),
(983, 0, 'atto_html', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054725),
(984, 0, 'atto_image', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054725),
(985, 0, 'atto_image', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054725),
(986, 0, 'atto_image', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054726),
(987, 0, 'atto_indent', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054726),
(988, 0, 'atto_indent', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054726),
(989, 0, 'atto_indent', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054726),
(990, 0, 'atto_italic', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054726),
(991, 0, 'atto_italic', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054726),
(992, 0, 'atto_italic', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054727),
(993, 0, 'atto_link', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054727),
(994, 0, 'atto_link', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054727),
(995, 0, 'atto_link', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054727),
(996, 0, 'atto_managefiles', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054727),
(997, 0, 'atto_managefiles', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054727),
(998, 0, 'atto_managefiles', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054727),
(999, 0, 'atto_media', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054728),
(1000, 0, 'atto_media', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054728),
(1001, 0, 'atto_media', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054728),
(1002, 0, 'atto_noautolink', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054728),
(1003, 0, 'atto_noautolink', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054728),
(1004, 0, 'atto_noautolink', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054728),
(1005, 0, 'atto_orderedlist', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054728),
(1006, 0, 'atto_orderedlist', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054729),
(1007, 0, 'atto_orderedlist', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054730),
(1008, 0, 'atto_rtl', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054730),
(1009, 0, 'atto_rtl', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054731),
(1010, 0, 'atto_rtl', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054731),
(1011, 0, 'atto_strike', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054731),
(1012, 0, 'atto_strike', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054731),
(1013, 0, 'atto_strike', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054731),
(1014, 0, 'atto_subscript', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054731),
(1015, 0, 'atto_subscript', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054731),
(1016, 0, 'atto_subscript', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054732),
(1017, 0, 'atto_superscript', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054732),
(1018, 0, 'atto_superscript', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054732),
(1019, 0, 'atto_superscript', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054732),
(1020, 0, 'atto_table', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054732),
(1021, 0, 'atto_table', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054732),
(1022, 0, 'atto_table', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054733),
(1023, 0, 'atto_title', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054733),
(1024, 0, 'atto_title', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054733),
(1025, 0, 'atto_title', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054733),
(1026, 0, 'atto_underline', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054733),
(1027, 0, 'atto_underline', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054733),
(1028, 0, 'atto_underline', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054734),
(1029, 0, 'atto_undo', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054734),
(1030, 0, 'atto_undo', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054734),
(1031, 0, 'atto_undo', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054734),
(1032, 0, 'atto_unorderedlist', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054734),
(1033, 0, 'atto_unorderedlist', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054734),
(1034, 0, 'atto_unorderedlist', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054735),
(1035, 0, 'tinymce_ctrlhelp', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054735),
(1036, 0, 'tinymce_ctrlhelp', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054735),
(1037, 0, 'tinymce_ctrlhelp', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054735),
(1038, 0, 'tinymce_managefiles', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054735),
(1039, 0, 'tinymce_managefiles', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054735),
(1040, 0, 'tinymce_managefiles', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054736),
(1041, 0, 'tinymce_moodleemoticon', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054736),
(1042, 0, 'tinymce_moodleemoticon', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054736),
(1043, 0, 'tinymce_moodleemoticon', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054736),
(1044, 0, 'tinymce_moodleimage', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054736),
(1045, 0, 'tinymce_moodleimage', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054737),
(1046, 0, 'tinymce_moodleimage', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054737),
(1047, 0, 'tinymce_moodlemedia', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054737),
(1048, 0, 'tinymce_moodlemedia', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054737),
(1049, 0, 'tinymce_moodlemedia', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054737),
(1050, 0, 'tinymce_moodlenolink', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054737),
(1051, 0, 'tinymce_moodlenolink', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054737),
(1052, 0, 'tinymce_moodlenolink', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054738),
(1053, 0, 'tinymce_pdw', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054738),
(1054, 0, 'tinymce_pdw', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054738),
(1055, 0, 'tinymce_pdw', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054738),
(1056, 0, 'tinymce_spellchecker', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054738),
(1057, 0, 'tinymce_spellchecker', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054738),
(1058, 0, 'tinymce_spellchecker', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054739),
(1059, 0, 'tinymce_wrap', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054739),
(1060, 0, 'tinymce_wrap', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054739),
(1061, 0, 'tinymce_wrap', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054739),
(1062, 0, 'logstore_database', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054739),
(1063, 0, 'logstore_database', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054739),
(1064, 0, 'logstore_database', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054740),
(1065, 0, 'logstore_legacy', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054740),
(1066, 0, 'logstore_legacy', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054740),
(1067, 0, 'logstore_legacy', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054740),
(1068, 0, 'logstore_standard', NULL, '2015051100', 'Starting plugin installation', NULL, '', 0, 1435054740),
(1069, 0, 'logstore_standard', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 0, 1435054741),
(1070, 0, 'logstore_standard', '2015051100', '2015051100', 'Plugin installed', NULL, '', 0, 1435054741),
(1071, 0, 'theme_essential', NULL, '2015060200', 'Starting plugin installation', NULL, '', 2, 1435142601),
(1072, 0, 'theme_essential', '2015060200', '2015060200', 'Upgrade savepoint reached', NULL, '', 2, 1435142601),
(1073, 0, 'theme_essential', '2015060200', '2015060200', 'Plugin installed', NULL, '', 2, 1435142601),
(1074, 0, 'block_faces', NULL, '2015052915', 'Starting plugin installation', NULL, '', 2, 1436925332),
(1075, 0, 'block_faces', '2015052915', '2015052915', 'Upgrade savepoint reached', NULL, '', 2, 1436925332),
(1076, 0, 'block_faces', '2015052915', '2015052915', 'Plugin installed', NULL, '', 2, 1436925333),
(1077, 0, 'block_font_recents', NULL, '2015051100', 'Starting plugin installation', NULL, '', 2, 1436925334),
(1078, 0, 'block_font_recents', '2015051100', '2015051100', 'Upgrade savepoint reached', NULL, '', 2, 1436925334),
(1079, 0, 'block_font_recents', '2015051100', '2015051100', 'Plugin installed', NULL, '', 2, 1436925335),
(1080, 0, 'block_userinfo', NULL, '2013082200', 'Starting plugin installation', NULL, '', 2, 1436925337),
(1081, 0, 'block_userinfo', '2013082200', '2013082200', 'Upgrade savepoint reached', NULL, '', 2, 1436925337),
(1082, 0, 'block_userinfo', '2013082200', '2013082200', 'Plugin installed', NULL, '', 2, 1436925338),
(1083, 0, 'format_grid', NULL, '2015062200', 'Starting plugin installation', NULL, '', 2, 1436925338),
(1084, 2, 'core', '2015051100.07', '2015051100.07', 'Exception: ddl_change_structure_exception', 'DDL sql execution error', '* line 449 of \\lib\\dml\\moodle_database.php: ddl_change_structure_exception thrown\n* line 905 of \\lib\\dml\\mysqli_native_moodle_database.php: call to moodle_database->query_end()\n* line 76 of \\lib\\ddl\\database_manager.php: call to mysqli_native_moodle_database->change_database_structure()\n* line 412 of \\lib\\ddl\\database_manager.php: call to database_manager->execute_sql_arr()\n* line 364 of \\lib\\ddl\\database_manager.php: call to database_manager->install_from_xmldb_structure()\n* line 504 of \\lib\\upgradelib.php: call to database_manager->install_from_xmldb_file()\n* line 1630 of \\lib\\upgradelib.php: call to upgrade_plugins()\n* line 433 of \\admin\\index.php: call to upgrade_noncore()\n', 2, 1436925339),
(1085, 0, 'format_grid', NULL, '2015062200', 'Starting plugin installation', NULL, '', 2, 1436925417),
(1086, 2, 'core', '2015051100.07', '2015051100.07', 'Exception: ddl_change_structure_exception', 'DDL sql execution error', '* line 449 of \\lib\\dml\\moodle_database.php: ddl_change_structure_exception thrown\n* line 905 of \\lib\\dml\\mysqli_native_moodle_database.php: call to moodle_database->query_end()\n* line 76 of \\lib\\ddl\\database_manager.php: call to mysqli_native_moodle_database->change_database_structure()\n* line 412 of \\lib\\ddl\\database_manager.php: call to database_manager->execute_sql_arr()\n* line 364 of \\lib\\ddl\\database_manager.php: call to database_manager->install_from_xmldb_structure()\n* line 504 of \\lib\\upgradelib.php: call to database_manager->install_from_xmldb_file()\n* line 1630 of \\lib\\upgradelib.php: call to upgrade_plugins()\n* line 433 of \\admin\\index.php: call to upgrade_noncore()\n', 2, 1436925417),
(1087, 0, 'block_slideshow', NULL, '2013091800', 'Starting plugin installation', NULL, '', 2, 1436945641),
(1088, 0, 'block_slideshow', '2013091800', '2013091800', 'Upgrade savepoint reached', NULL, '', 2, 1436945641),
(1089, 0, 'block_slideshow', '2013091800', '2013091800', 'Plugin installed', NULL, '', 2, 1436945642);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_url`
--

CREATE TABLE IF NOT EXISTS `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `parameters` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one url resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user`
--

CREATE TABLE IF NOT EXISTS `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(100) NOT NULL DEFAULT '',
  `lastname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) NOT NULL DEFAULT '',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `yahoo` varchar(50) NOT NULL DEFAULT '',
  `aim` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `phone1` varchar(20) NOT NULL DEFAULT '',
  `phone2` varchar(20) NOT NULL DEFAULT '',
  `institution` varchar(255) NOT NULL DEFAULT '',
  `department` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `lang` varchar(30) NOT NULL DEFAULT 'en',
  `calendartype` varchar(30) NOT NULL DEFAULT 'gregorian',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timezone` varchar(100) NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) NOT NULL DEFAULT '',
  `secret` varchar(15) NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) DEFAULT NULL,
  `lastnamephonetic` varchar(255) DEFAULT NULL,
  `firstnamephonetic` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `alternatename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`),
  KEY `mdl_user_fir2_ix` (`firstnamephonetic`),
  KEY `mdl_user_las3_ix` (`lastnamephonetic`),
  KEY `mdl_user_mid_ix` (`middlename`),
  KEY `mdl_user_alt_ix` (`alternatename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='One record for each person' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_user`
--

INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `calendartype`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`, `lastnamephonetic`, `firstnamephonetic`, `middlename`, `alternatename`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest', '$2y$10$vqc8pcHDCBjFciI6ZP368eNgG4be8WxIVY73P6RH49Khj6OAwQL/K', '', 'Guest user', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 'This user is a special user that allows read-only access to some courses.', 1, 1, 0, 2, 1, 0, 0, 1435054160, 0, NULL, NULL, NULL, NULL, NULL),
(2, 'manual', 1, 0, 0, 0, 1, 'admin', '$2y$10$GuO3g4zeSIchq7.Ft4XIrOZdl8DVBOsezmiHJD1nKygS5HHW9tiTS', '', 'Admin', 'User', 'ptnhuan@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', 'gregorian', '', 'Asia/Ho_Chi_Minh', 1435054829, 1436958110, 1435144368, 1436925242, '0:0:0:0:0:0:0:1', '', 0, '', '', 1, 1, 0, 0, 1, 0, 0, 1435055101, 0, NULL, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_devices`
--

CREATE TABLE IF NOT EXISTS `mdl_user_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `appid` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `model` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(32) NOT NULL DEFAULT '',
  `pushid` varchar(255) NOT NULL DEFAULT '',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`),
  KEY `mdl_userdevi_uuiuse_ix` (`uuid`,`userid`),
  KEY `mdl_userdevi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table stores user''s mobile devices information in order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users participating in courses (aka enrolled users) - everyb' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_category`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable fields categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_data`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userinfodata_usefie_uix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data for the customisable user fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_field`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) NOT NULL DEFAULT 'shortname',
  `name` longtext NOT NULL,
  `datatype` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable user profile fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_lastaccess`
--

CREATE TABLE IF NOT EXISTS `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='To keep track of course page access times, used in online pa' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_user_lastaccess`
--

INSERT INTO `mdl_user_lastaccess` (`id`, `userid`, `courseid`, `timeaccess`) VALUES
(1, 2, 2, 1436957970),
(2, 2, 4, 1436958033),
(3, 2, 3, 1436958003);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_password_history`
--

CREATE TABLE IF NOT EXISTS `mdl_user_password_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `hash` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userpasshist_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A rotating log of hashes of previously used passwords for ea' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_password_resets`
--

CREATE TABLE IF NOT EXISTS `mdl_user_password_resets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timerequested` bigint(10) NOT NULL,
  `timererequested` bigint(10) NOT NULL DEFAULT '0',
  `token` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_userpassrese_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table tracking password reset confirmation tokens' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_preferences`
--

CREATE TABLE IF NOT EXISTS `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(1333) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Allows modules to store arbitrary user preferences' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `mdl_user_preferences`
--

INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(1, 2, 'auth_manual_passwordupdatetime', '1435055101'),
(2, 2, 'email_bounce_count', '1'),
(3, 2, 'email_send_count', '1'),
(4, 2, 'docked_block_instance_4', '0'),
(5, 2, 'docked_block_instance_5', '0'),
(6, 2, 'login_failed_count_since_success', '1'),
(7, 2, 'block5hidden', '0'),
(8, 2, 'filepicker_recentrepository', '4'),
(9, 2, 'filepicker_recentlicense', 'allrightsreserved'),
(10, 2, 'block26hidden', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_private_key`
--

CREATE TABLE IF NOT EXISTS `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='access keys used in cookieless scripts - rss, etc.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_webdav_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_webdav_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `expiry` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `recursive` tinyint(1) NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  KEY `mdl_webdlock_pat_ix` (`path`),
  KEY `mdl_webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource locks for WebDAV users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT 'Wiki',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Wiki activity configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_links`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Page wiki links' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Manages page locks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT 'title',
  `cachedcontent` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_subwikis`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores subwiki instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_synonyms`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages synonyms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_versions`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `contentformat` varchar(20) NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki page history' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `evaluation` varchar(30) NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about the module instances and ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) DEFAULT NULL,
  `resultlog` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the allocation settings for the scheduled allocator' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Settings for the grading evaluation subplugin Comparison wit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_accumulative`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Accumulative gradin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Comments strategy f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) DEFAULT NULL,
  `grade1` varchar(50) DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Number of errors gr' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This maps the number of errors to a percentual grade for sub' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Rubric grading stra' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Configuration table for the Rubric grading strategy' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The definition of rubric rating scales' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_aggregations`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Aggregated grades for assessment are stored here. The aggreg' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the made assessment and automatically calculated ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext,
  `teachercomment` longtext,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_assessments table to be dropped later in Moo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_comments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_comments table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_elements_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_elements table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='How the reviewers filled-up the grading forms, given grades ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop table to be dropped later in Moodle 2.x' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_stockcomments table to be dropped later in M' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the submission and the aggregation of the grade f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_submissions table to be dropped later in Moo' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
