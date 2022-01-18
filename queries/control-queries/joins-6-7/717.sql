select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 9 and ss.ss_hash <= 409 and d.d_hash >= 255 and d.d_hash <= 588 and cd.cd_hash >= 91 and cd.cd_hash <= 841
;
