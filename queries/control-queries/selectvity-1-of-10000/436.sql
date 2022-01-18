select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 423 and ss.ss_hash <= 443 and hd.hd_hash >= 251 and hd.hd_hash <= 351 and i.i_hash >= 425 and i.i_hash <= 475
;
