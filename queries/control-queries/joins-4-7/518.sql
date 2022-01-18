select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 156 and ss.ss_hash <= 906 and hd.hd_hash >= 515 and hd.hd_hash <= 848 and d.d_hash >= 90 and d.d_hash <= 490
;
