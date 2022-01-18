select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 331 and ss.ss_hash <= 731 and hd.hd_hash >= 390 and hd.hd_hash <= 723 and i.i_hash >= 93 and i.i_hash <= 843
;
