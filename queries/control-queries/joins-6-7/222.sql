select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 185 and c.c_hash <= 935 and hd.hd_hash >= 578 and hd.hd_hash <= 978 and cd.cd_hash >= 260 and cd.cd_hash <= 593
;
