select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 18 and ss.ss_hash <= 68 and hd.hd_hash >= 100 and hd.hd_hash <= 200 and d.d_hash >= 325 and d.d_hash <= 345
;
