select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 306 and cd.cd_hash <= 639 and hd.hd_hash >= 52 and hd.hd_hash <= 802 and i.i_hash >= 360 and i.i_hash <= 760
;
