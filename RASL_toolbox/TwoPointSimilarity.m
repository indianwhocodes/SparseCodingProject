function A = TwoPointSimilarity( Pts1, Pts2 )

%%% add a third point
Delta = [0 -1; 1 0];
Pts1 = [ Pts1, Pts1(:,1) + Delta*(Pts1(:,2)-Pts1(:,1)) ];
Pts2 = [ Pts2, Pts2(:,1) + Delta*(Pts2(:,2)-Pts2(:,1)) ];
Pts1 = [ Pts1; ones(1,3) ];
D = kron(eye(2),Pts1');
A_tr_vec = inv(D) * [Pts2(1,:)'; Pts2(2,:)'];
A = nan(2,3);
A(1,:) = A_tr_vec(1:3)';
A(2,:) = A_tr_vec(4:6)';