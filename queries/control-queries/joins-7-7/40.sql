select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a,item i,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 190 and c.c_hash <= 590 and i.i_hash >= 535 and i.i_hash <= 868 and cd.cd_hash >= 93 and cd.cd_hash <= 843
;
