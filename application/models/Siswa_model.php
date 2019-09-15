<?php

class Siswa_model extends CI_Model
{
    public function getSiswa($id = null){
        if ($id === null) {
            return $this->db->get('siswa')->result_array();
        }else{
            return $this->db->get_where('siswa',['id' => $id])->result_array();
        }
    }

    public function deleteSiswa($id){
        $this->db->delete('siswa', ['id' => $id]);
        return $this->db->affected_rows();
    }

    public function createSiswa($data){
        $this->db->insert('siswa',$data);
        return $this->db->affected_rows();
    }

    public function updateSiswa($data,$id){
        $this->db->update('siswa',$data,['id' => $id]);
        return $this->db->affected_rows();
    }
}