<?php

class Siswa_API_model extends CI_Model
{
    public function getSiswa($id){

        // $this->db->SELECT('NAMA');
        // $this->db->SELECT('JENIS_KELAMIN');

        $this->db->SELECT('*');
        $this->db->SELECT('peg_kelas.nama_kelas');
        $this->db->FROM('peg_siswa');
        $this->db->JOIN('peg_kelas_siswa', 'peg_siswa.id_siswa = peg_kelas_siswa.id_siswa','right');
        $this->db->JOIN('peg_mengajar', 'peg_mengajar.id_kelas = peg_kelas_siswa.id_kelas','left');
        $this->db->JOIN('peg_kelas','peg_kelas_siswa.id_kelas = peg_kelas.id_kelas','left');
        $this->db->WHERE('peg_kelas_siswa.id_kelas = peg_kelas.id_kelas');
        $this->db->WHERE('peg_mengajar.user_id ='.$id);
        $this->db->ORDER_BY('peg_siswa.NAMA','asc');

        $data = $this->db->get()->result_array();
        return $data;
    }
}