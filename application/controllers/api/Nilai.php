<?php
use Restserver\Libraries\REST_Controller;

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Nilai extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Nilai_API_model','nilai');
    }

    public function index_get()
    {
        $data = array(
            "dataku" => array(
                "nama" => "Petani Kode",
                "url" => "http://petanikode.com"
            )
        );

        $this->load->library('pdf');

        $this->pdf->setPaper('A4', 'potrait');
        $this->pdf->filename = "Transkrip Nilai.pdf";
        $this->pdf->load_view('transkrip_pdf', $data);
    }
}

?>