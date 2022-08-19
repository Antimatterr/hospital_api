
import pool from "../config/database";


const hospitalController = {
  async index(req, res, next) {
    let hospital_id = req.params.id
    console.log(hospital_id);

    const data = {};

    pool.query(`select lattice_hospital.name, COUNT(*) as patient_count from lattice_hospital JOIN lattice_patient on lattice_patient.hospital_id = ${hospital_id} and lattice_hospital.id=${hospital_id} group by(lattice_patient.hospital_id)`, (err, results) => {
      if (err) {
        throw err;
      }
      const name = results[0].name
      const patient_count = results[0].patient_count
      data.name = name;
      data.patient_count = patient_count;



      pool.query(`select count(*) as psych_count from lattice_psychiatrist GROUP BY(lattice_psychiatrist.hospital_id) HAVING lattice_psychiatrist.hospital_id=${hospital_id}`, (err, results) => {
        if (err) {
          throw err;
        }
        const psych_count = results[0].psych_count;
        data.psychiatrist_count = psych_count;



        pool.query(`select lattice_psychiatrist.id, lattice_psychiatrist.name, lattice_psychiatrist.patient_count from lattice_psychiatrist where lattice_psychiatrist.hospital_id=${hospital_id}`, (err, results) => {
          if (err) {
            throw err;
          }
          const psych_data = results;
          data.psychiatrist_details = psych_data;

          console.log(data);
          return res.json(data);
        })

      })

    })




  }



}

export default hospitalController;