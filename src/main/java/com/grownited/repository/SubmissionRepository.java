package com.grownited.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.SubmissionEntity;

@Repository
public interface SubmissionRepository extends JpaRepository<SubmissionEntity, Integer> {
    List<SubmissionEntity> findByHackathonId(Integer hackathonId);
    Long countByUserId(Integer userId);
    Long countByHackathonId(Integer hackathonId);
    Optional<SubmissionEntity> findByHackathonIdAndUserId(Integer hackathonId, Integer userId);
    Optional<SubmissionEntity> findByHackathonIdAndTeamId(Integer hackathonId, Integer teamId);
}
