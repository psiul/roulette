select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 606 and c.c_hash <= 626 and hd.hd_hash >= 33 and hd.hd_hash <= 83 and cd.cd_hash >= 586 and cd.cd_hash <= 686
;
