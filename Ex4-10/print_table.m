function print_table()
    global oo_

    sd_list = sqrt(diag(oo_.var))*100;
    ac_list = diag(oo_.autocorr{1});
    ry_list = oo_.var(:,8)/sqrt(oo_.var(8,8))./sqrt(diag(oo_.var));

    var_list   = {'y','c','i','h','tb_y','ca_y'};
    index_list = [8,2,5,4,10,11];

    fprintf('\n');
    fprintf('Results of table 4.2:\n');
    fprintf('\n');
    fprintf('Variable  sig_x       rho1       rho2\n')
    for i = 1:length(index_list)
        fprintf('%4s   %8.2f   %8.2f   %8.2f\n', var_list{i}, sd_list(index_list(i)), ac_list(index_list(i)), ry_list(index_list(i)));
    end
    fprintf('\n');

end