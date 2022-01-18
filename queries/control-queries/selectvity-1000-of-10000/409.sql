select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 129 and ss.ss_hash <= 879 and d.d_hash >= 206 and d.d_hash <= 539 and hd.hd_hash >= 210 and hd.hd_hash <= 610
;
