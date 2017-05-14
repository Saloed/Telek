function lab7()
close all
format loose
clc
out = randerr(1,4);
disp('Hamming')
fprintf('Исходное сообщение\n');
disp(out);
code = encode (out, 7, 4, 'hamming/binary');
fprintf('Кодированное сообщение\n');
disp(code);
dcode = decode (code, 7, 4, 'hamming/binary');
fprintf('Декодированное сообщение\n');
disp(dcode)

msg = out;
[h, gen] = hammgen(3);
% gen = gen2par(h);
code = rem(msg * gen, 2);
trt = syndtable(h);
syndrome = rem(code * h', 2);
    
% error location:
err = bi2de(fliplr(syndrome));
err_loc = trt(err + 1, :);

% corrected code
ccode = rem(err_loc + code, 2);

dcode = ccode(7 - 4 + 1:7);


fprintf('Порождающая матрица\n');
disp(gen)
fprintf('Проверочная матрица\n');
disp(h)

fprintf('Исходное сообщение\n');
disp(msg)
fprintf('Кодированное сообщение\n');
disp(code)
fprintf('Синдром\n');
disp(syndrome)
fprintf('Скорректированное сообщение\n');
disp(ccode)
fprintf('Декодированное сообщение\n');
disp(dcode)

disp('Cyclic')
out = randerr(1,4);
fprintf('Исходное сообщение\n');
disp(out);
code = encode (out, 7, 4, 'cyclic/binary');
fprintf('Кодированное сообщение\n');
disp (code);
dcode = decode (code, 7, 4, 'cyclic/binary');
fprintf('Декодированное сообщение\n');
disp(dcode)


m = 4;
n = 2^m-1; 
k = 5;       
nwords = 5; 
msg = randi([0 1],nwords,k);
code = gf(msg);
[poly,t] = bchgenpoly(n,k);
enc = bchenc(code,n,k);
noisycode = enc + randerr(nwords,n,1:t);
dcode = bchdec(noisycode,n,k);

fprintf('Исходное сообщение\n');
disp(msg)
fprintf('Полином\n');
disp(poly.x)
fprintf('Кодированное сообщение\n');
disp(enc.x)
fprintf('Декодированное сообщение\n');
disp(dcode.x)
disp('Rid - Salomon')

m = 3;           
n = 2^m - 1;    
k = 3;          

msg = gf([2 7 3; 4 0 6; 5 1 1],m);
code = rsenc(msg,n,k);

errors = gf([2 0 0 0 0 0 0; 3 4 0 0 0 0 0; 5 6 7 0 0 0 0],m);
noisycode = code + errors;

[dcode,cnumerr] = rsdec(noisycode,n,k);

fprintf('Исходное сообщение\n');
disp(msg.x)
fprintf('Кодированное сообщение\n');
disp(code.x)
fprintf('Декодированное сообщение\n');
disp(dcode.x)
fprintf('Число исправленных ошибок\n');
disp(cnumerr)
end