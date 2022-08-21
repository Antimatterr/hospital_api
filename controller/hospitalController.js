
import pool from "../config/database";
import CustomErrorHandler from "../services/CustomErrorHandler";


const hospitalController = {
  async index(req, res, next) {
    let hospital_id = req.params.id
    console.log(hospital_id);

    const data = {};

    pool.query(`select lattice_hospital.name, COUNT(*) as patient_count from lattice_hospital JOIN lattice_patient on lattice_patient.hospital_id = ${hospital_id} and lattice_hospital.id=${hospital_id} group by(lattice_patient.hospital_id)`, (err, results) => {
      if (err) {
        return res.status(500).json({ message: "Internal server error" })
      }
      if (results.length) {
        const name = results[0].name
        const patient_count = results[0].patient_count
        data.name = name;
        data.patient_count = patient_count;



        pool.query(`select count(*) as psych_count from lattice_psychiatrist GROUP BY(lattice_psychiatrist.hospital_id) HAVING lattice_psychiatrist.hospital_id=${hospital_id}`, (err, results) => {
          if (err) {
            return res.status(500).json({ message: "Internal server error" })
          }
          if (results.length) {
            const psych_count = results[0].psych_count;
            data.psychiatrist_count = psych_count;



            pool.query(`select lattice_psychiatrist.id, lattice_psychiatrist.name, lattice_psychiatrist.patient_count from lattice_psychiatrist where lattice_psychiatrist.hospital_id=${hospital_id}`, (err, results) => {
              if (err) {
                return res.status(500).json({ message: "Internal server error" })
              }
              const psych_data = results;
              data.psychiatrist_details = psych_data;


              return res.json(data);
            })
          }
          else {
            return res.status(404).json({ status: 0, message: "No result found" });
          }

        })
      }
      else {
        return res.status(404).json({ status: 0, message: "No result found" });
      }


    })




  }



}

export default hospitalController;