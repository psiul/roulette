select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 328 and ss.ss_hash <= 828 and i.i_hash >= 541 and i.i_hash <= 741
;
