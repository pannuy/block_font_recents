<?php

class block_font_recents extends block_base {

    public function init() {
        $this->title = get_string('font_recents', 'block_font_recents');
    }

    // The PHP tag and the curly bracket for the class definition 
    // will only be closed after there is another function added in the next section.

    public function get_content() {
        global $DB, $CFG, $OUTPUT;
        if ($this->content !== null) {
            return $this->content;
        }

        $this->content = new stdClass;
        $this->content->text = '';

        $courses = $DB->get_records('course');

        //$this->content->text .= html_writer::start_tag('div',array('class' => 'span12'));

        foreach ($courses as $course) {

            $this->content->text .= html_writer::start_tag('div', array('class' => 'content font-recent span3'));

            $this->content->text .=html_writer::tag('a', $course->fullname, array('class' => 'font-recent', 'href' => $CFG->wwwroot . '/course/view.php?id=' . $course->id));

            $this->content->text .= html_writer::img($CFG->wwwroot . '/pluginfile.php/27/course/overviewfiles/hinh1.jpg', '', array('class' => 'font-recent-image'));

            $this->content->text .= html_writer::end_tag('div');
        }

        //$this->content->text .= html_writer::end_tag('div');

        return $this->content;
    }

}

// Here's the closing bracket for the class definition