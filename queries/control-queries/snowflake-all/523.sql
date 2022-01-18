select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 238 and ss.ss_hash <= 988 and i.i_hash >= 184 and i.i_hash <= 517 and hd.hd_hash >= 82 and hd.hd_hash <= 482
;
