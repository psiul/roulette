select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 378 and ss.ss_hash <= 711 and hd.hd_hash >= 329 and hd.hd_hash <= 729 and c.c_hash >= 157 and c.c_hash <= 907
;
