select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 347 and ss.ss_hash <= 447 and hd.hd_hash >= 268 and hd.hd_hash <= 768 and cd.cd_hash >= 267 and cd.cd_hash <= 467
;
