function A = ThreePointAffine( Pts1, Pts2 )

X = [Pts2' ones(3,1)];
U = Pts1';
Tinv = X \ U;
Tinv(:,3) = [0 0 1]';
T = inv(Tinv);
T(:,3) = [0 0 1]';
A = T(:,1:2)';