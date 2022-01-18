select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 28 and ss.ss_hash <= 778 and d.d_hash >= 585 and d.d_hash <= 918 and cd.cd_hash >= 22 and cd.cd_hash <= 422
;
