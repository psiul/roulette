select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 284 and cd.cd_hash <= 684 and i.i_hash >= 164 and i.i_hash <= 914 and hd.hd_hash >= 231 and hd.hd_hash <= 564
;
