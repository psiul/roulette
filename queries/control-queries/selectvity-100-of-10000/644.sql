select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 328 and d.d_hash <= 528 and cd.cd_hash >= 508 and cd.cd_hash <= 608 and i.i_hash >= 425 and i.i_hash <= 925
;
