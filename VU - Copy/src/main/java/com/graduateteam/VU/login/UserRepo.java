package com.graduateteam.VU.patients.login;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo  extends CrudRepository<User,String > {

    //User Authentication
    @Query("select count(*) from doctor_phone where phone=:phone")
    public int countDoctorByPhone(String  phone);
    @Query("select count(*) from nurse_phone where phone=:phone")
    public int countNurseByPhone(String  phone);

}
