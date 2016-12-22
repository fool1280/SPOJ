const fi='';
      fo='';
var s:string[255];
    f:array[1..255,1..255] of boolean;
procedure Init;
var i,j,n,k:longint;
begin
        n:=length(s);
        for i:=1 to n do
        for j:=1 to n do f[i,j]:=false;
        for i:=1 to n do f[i,i]:=true;
        for i:=1 to n-1 do
        begin
                for k:=1 to n-i do
                begin
                        j:=i+k;
                        f[k,j]:= ((s[k]=s[j]) and (f[k+1,j-1])) or ((s[k]=s[j]) and (j-k=1));
                end;
        end;
end;
procedure Process;
var kq:array[0..255] of longint;
    i,j,n:longint;
begin
        kq[0]:=0;
        n:=length(s);
        for i:=1 to n do kq[i]:=n;
        for i:=1 to n do
        begin
                for j:=1 to i do if f[j,i] and (kq[j-1]+1<kq[i]) then kq[i]:=kq[j-1]+1;
        end;
        write(kq[n]);
end;
begin
        read(s);
        Init;
        Process;
end.
