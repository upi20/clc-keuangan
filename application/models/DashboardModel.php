<?php
defined('BASEPATH') or exit('No direct script access allowed');

class DashboardModel extends Render_Model
{
    public function getData()
    {
        $data['jml'] = $this->db->get('cabangs')->num_rows();
        $data['profile'] = $this->db->select('kode, no_telpon, alamat, nama')
            ->from('cabangs')
            ->where(['id' => 1])
            ->get()
            ->row_array();

        return ($data);
    }
}
