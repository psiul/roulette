select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 703 and ss.ss_hash <= 803 and cd.cd_hash >= 521 and cd.cd_hash <= 721 and i.i_hash >= 580 and i.i_hash <= 630
;
