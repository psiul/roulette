select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 389 and i.i_hash <= 722 and cd.cd_hash >= 171 and cd.cd_hash <= 921 and d.d_hash >= 181 and d.d_hash <= 581
;
