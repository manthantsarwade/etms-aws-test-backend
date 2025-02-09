package com.etms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.etms.pojos.Manager;
@Repository
public interface ManagerRepository extends JpaRepository<Manager, Long> {

}
