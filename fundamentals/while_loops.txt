1. while loops
  syntax:
    while condition (do)
      // body code
    end
  example:
    x = 0
    while x<10
       puts x
       x += 1
    end
  - condition là biểu thức boolean
	body chứa code sẽ chạy nếu condition trả về true.
  - Vòng lặp sẽ có số lần chạy từ 0(condition trả về false or nil) -> n
  modified
    Nếu body vòng lặp là các biểu thức đơn, có thể modified ở dạng nhỏ gọn hơn:
      x = 0
      puts x = x + 1 while x < 10
2. until loops
   syntax:
	until condition (do)
	   // body code
	end
   example:
	x = 10
	until x > 0 do
	  puts x
	  x -= 1
	end
   - condition là biểu thức boolean, nhưng ngược lại với while, body chưa code
    sẽ chạy khi biểu thức condition vẫn trả về false or nil
   - Vòng lặp có số lần chạy: 0(condition trả về true) -> n
   - Có thể chuyển thành vòng lặp while bằng cách phủ định condition
  Modifield
	Nếu body vòng lặp là biểu thức đơn, có thể modifield ở dạng nhỏ gọn hơn:
	  x = 10
	  puts x = x -1 until x > 0
3. for và for/in loops
 Hai dạng vòng lặp này khá giống với các ngôn ngữ lập trình khác nên mình ko trình bày nữa.
