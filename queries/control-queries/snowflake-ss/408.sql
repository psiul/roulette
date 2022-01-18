select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 531 and ss.ss_hash <= 864 and d.d_hash >= 185 and d.d_hash <= 935 and hd.hd_hash >= 597 and hd.hd_hash <= 997
;