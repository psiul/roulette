select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 446 and ss.ss_hash <= 779 and hd.hd_hash >= 96 and hd.hd_hash <= 496 and cd.cd_hash >= 109 and cd.cd_hash <= 859
;
