DELIMITER //
create procedure BookLibrary_Insert (p_LibraryAddress varchar(100),
    p_OpeningTime time, p_ClosingTime time, p_NumberOfRentalHours int)
begin
	declare have_record int;
    select count(*) into have_record from BookLibrary
	where LibraryAddress = p_LibraryAddress
		and OpeningTime = p_OpeningTime
		and ClosingTime = p_ClosingTime
		and NumberOfRentalHours = p_NumberOfRentalHours;
	if have_record > 0 then
		select 'There is already book library with the specified data.' as "Error";
    else
		insert into BookLibrary (LibraryAddress, OpeningTime, ClosingTime,
			NumberOfRentalHours)
		values (p_LibraryAddress, p_OpeningTime, p_ClosingTime,
			p_NumberOfRentalHours);
	end if;
end;