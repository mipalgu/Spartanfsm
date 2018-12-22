if h_count >= h_max then
	h_count <= 0;
	if v_count >= v_max then
		v_count <= 0;
	else
		v_count <= v_count + 1;
	end if;
else
	h_count <= h_count + 1;
end if;
