select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,item i,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 76 and hd.hd_hash <= 826 and i.i_hash >= 547 and i.i_hash <= 880 and d.d_hash >= 331 and d.d_hash <= 731
;
