select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 97 and ss.ss_hash <= 847 and cd.cd_hash >= 449 and cd.cd_hash <= 849 and d.d_hash >= 314 and d.d_hash <= 647
;
