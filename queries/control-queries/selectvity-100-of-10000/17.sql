select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 278 and ss.ss_hash <= 778 and i.i_hash >= 476 and i.i_hash <= 676 and cd.cd_hash >= 654 and cd.cd_hash <= 754
;
