function array_smoothed=smooth_3d(array,window_size)
    array_smoothed=zeros(1,window_size);
    for i=2:window_size
        array_smoothed(i)=(array(i)+array(i-1))/2.1;
    end
end
