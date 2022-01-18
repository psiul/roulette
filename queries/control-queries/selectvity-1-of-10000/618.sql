select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 771 and ss.ss_hash <= 821 and d.d_hash >= 156 and d.d_hash <= 256 and hd.hd_hash >= 257 and hd.hd_hash <= 277
;
