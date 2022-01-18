select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 172 and d.d_hash <= 505 and i.i_hash >= 443 and i.i_hash <= 843 and hd.hd_hash >= 198 and hd.hd_hash <= 948
;
