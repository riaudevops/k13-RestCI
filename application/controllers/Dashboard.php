<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    public function index()
    {
        if ($this->session->userdata('email')) {
            $data['activeTab'] = 1;
            $this->load->view('templates/header',$data);
            $this->load->view('dashboard/index');
            $this->load->view('templates/footer');
        }else{
        	redirect('auth');
        }
    }
}
