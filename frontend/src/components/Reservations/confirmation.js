import React from "react";
import { useLocation, Link } from "react-router-dom";
// import restaurantsReducer from "../../store/restaurants";
import UpdateReservationButton from "./update-reservation";
import DeleteReservationButton from "./reservation_remove";
// import Navigation from "../Navigation/index";
import { useSelector } from "react-redux";

function ReservationConfirmation() {
  const location = useLocation();
  const reservation = useSelector((state) => Object.values(state.reservs)[0]);
  // const restaurants = location.state?.restaurants;
//   console.log(location.state);

const capitalizeFirstLetter = (string) => {
  if (!string) return ''; // Return an empty string if the input is not defined
  return string.charAt(0).toUpperCase() + string.slice(1);
};

  const formatTime = (time) => {
    const [hour, minute] = time.split(":");
    const parsedHour = parseInt(hour);
    const isPM = parsedHour >= 12;
    const hour12 = parsedHour === 0 ? 12 : parsedHour > 12 ? parsedHour - 12 : parsedHour;

    return `${hour12}:${minute} ${isPM ? "PM" : "AM"}`;
  };

  return (
    <div className="confirm-container">
      <div className="nav-bar1">
        {/* <Navigation /> */}
      </div>
      <div className="page-details">
        <h5>Reservation Confirmation</h5>
        {reservation && (
          <div>
            <span className="detail">Name<p className="reserv_det">{capitalizeFirstLetter(reservation.first_name)}</p></span>
            <span className="detail">Restaurant Name<p className="reserv_det">{reservation.rname}</p></span>
            <span className="detail">Phone Number<p className="reserv_det">{reservation.phone_number}</p></span>
            <span className="detail">Party Size<p className="reserv_det">{reservation.party_size || 1}</p></span>
            <span className="detail">Date<p className="reserv_det">{reservation.date}</p></span>
            <span className="detail">Time<p className="reserv_det">{formatTime(reservation.time)}</p></span>
            <div className="confirm-button">
          <Link to="/profile">
            <button className="confirm-btn">Confirm Reservation</button>
          </Link>
          <div className="reserv-crud">
            <UpdateReservationButton reservation={reservation} />
                <DeleteReservationButton reservationId={reservation.id} />

  </div>
        </div>
          </div>
        )}
      </div>
    </div>
  );
}

export default ReservationConfirmation;
