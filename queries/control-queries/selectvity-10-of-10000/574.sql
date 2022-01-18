select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 186 and ss.ss_hash <= 386 and cd.cd_hash >= 527 and cd.cd_hash <= 627 and d.d_hash >= 540 and d.d_hash <= 590
;
