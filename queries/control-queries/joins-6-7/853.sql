select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 176 and hd.hd_hash <= 926 and c.c_hash >= 426 and c.c_hash <= 759 and cd.cd_hash >= 432 and cd.cd_hash <= 832
;
