select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 66 and ss.ss_hash <= 566 and cd.cd_hash >= 517 and cd.cd_hash <= 717 and i.i_hash >= 111 and i.i_hash <= 211
;
