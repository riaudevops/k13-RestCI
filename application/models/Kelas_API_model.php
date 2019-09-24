<?php

class Kelas_API_model extends CI_Model
{
    public function getKelas($id){
            $this->db->SELECT('*');
            $this->db->FROM('peg_mengajar');
            $this->db->JOIN('peg_guru', 'peg_mengajar.user_id = peg_guru.id','left');
            $this->db->JOIN('peg_kelas', 'peg_mengajar.id_kelas = peg_kelas.id_kelas','left');
            $this->db->JOIN('peg_mapel', 'peg_mengajar.id_mapel = peg_mapel.id_mapel','left');
            $this->db->WHERE('user_id ='.$id);
            return $this->db->get()->result_array();
    }

    public function getSiswaKelas($id_kelas){
    	$this->db->SELECT('*');
    	$this->db->FROM('peg_siswa');
    	$this->db->JOIN('peg_kelas_siswa','peg_siswa.id_siswa = peg_kelas_siswa.id_siswa','left');
    	$this->db->WHERE('peg_kelas_siswa.id_kelas ='.$id_kelas);
    	return $this->db->get()->result_array();
    }
}