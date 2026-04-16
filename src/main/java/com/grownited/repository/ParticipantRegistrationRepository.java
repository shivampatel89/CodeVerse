package com.grownited.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grownited.entity.ParticipantRegistrationEntity;

@Repository
public interface ParticipantRegistrationRepository extends JpaRepository<ParticipantRegistrationEntity, Integer> {
    Optional<ParticipantRegistrationEntity> findByHackathonIdAndUserId(Integer hackathonId, Integer userId);
    Optional<ParticipantRegistrationEntity> findByStripeSessionId(String stripeSessionId);
    Long countByUserId(Integer userId);
    Long countByHackathonId(Integer hackathonId);
    java.util.List<ParticipantRegistrationEntity> findByUserId(Integer userId);
    java.util.List<ParticipantRegistrationEntity> findByHackathonId(Integer hackathonId);
    java.util.List<ParticipantRegistrationEntity> findByTeamId(Integer teamId);
}
